import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:character_creater/providers/character.dart';
import 'package:character_creater/models/character.dart';

class CharacterEdit extends HookConsumerWidget {
  CharacterEdit(this.characterId, {super.key});

  final int? characterId;

  final characterNameController = TextEditingController();
  final characterLevelController = TextEditingController();
  final characterHpController = TextEditingController();
  final characterMpController = TextEditingController();
  final characterAttackController = TextEditingController();
  final characterDefenceController = TextEditingController();
  final characterSpeedController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterProvider);
    final characterNotifier = ref.read(characterProvider.notifier);
    final isLoading = useState<bool>(true);
    final isSaving = useState<bool>(false);
    final isValid = useState<bool>(false);
    final character = useMemoized<CharacterModel?>(
        () => characterId != null && characterList.isNotEmpty
            ? characterList.firstWhere((c) => c.id == characterId)
            : null,
        [characterId]);

    // useMemoizedでhookできないので自前でチェックする
    final validation = useCallback(() => {
          isValid.value = characterNameController.text.isNotEmpty &&
              characterLevelController.text.isNotEmpty &&
              characterHpController.text.isNotEmpty &&
              characterMpController.text.isNotEmpty &&
              characterAttackController.text.isNotEmpty &&
              characterDefenceController.text.isNotEmpty &&
              characterSpeedController.text.isNotEmpty
        });

    useEffect(
      () {
        characterNotifier.getAll().then((_) {
          if (characterId != null) {
            characterNameController.text = character!.name;
            characterLevelController.text = character.level.toString();
            characterHpController.text = character.maxHp.toString();
            characterMpController.text = character.maxMp.toString();
            characterAttackController.text = character.attack.toString();
            characterDefenceController.text = character.defense.toString();
            characterSpeedController.text = character.speed.toString();
            validation();
          }
          characterNameController.addListener(validation);
          characterLevelController.addListener(validation);
          characterHpController.addListener(validation);
          characterMpController.addListener(validation);
          characterAttackController.addListener(validation);
          characterDefenceController.addListener(validation);
          characterSpeedController.addListener(validation);
          isLoading.value = false;
        });
        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(characterId != null ? '編集' : '新規作成'),
        actions: <Widget>[
          Visibility(
            visible: characterId != null,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('本当に削除しますか？'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('キャンセル'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await characterNotifier.delete(character!.id!);
                            int count = 0;
                            if (context.mounted) {
                              Navigator.of(context)
                                  .popUntil((_) => count++ >= 2);
                            }
                          },
                          child: const Text('削除'),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              characterId != null
                  ? 'キャラクターID: ${characterId.toString()}'
                  : '新規キャラクター',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '名前: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            controller: characterNameController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Lv: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 60,
                            child: TextField(
                              controller: characterLevelController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(width: 4),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'HP: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 80,
                            child: TextField(
                              controller: characterHpController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'MP: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 80,
                            child: TextField(
                              controller: characterMpController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '攻撃力: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 80,
                            child: TextField(
                              controller: characterAttackController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '防御力: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 80,
                            child: TextField(
                              controller: characterDefenceController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '素早さ: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 80,
                            child: TextField(
                              controller: characterSpeedController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox(width: 4)),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton.icon(
                onPressed: !isSaving.value && isValid.value
                    ? () async {
                        isSaving.value = true;
                        final chara = CharacterModel(
                            id: characterId,
                            name: characterNameController.text,
                            level: int.parse(characterLevelController.text),
                            maxHp: int.parse(characterHpController.text),
                            maxMp: int.parse(characterMpController.text),
                            attack: int.parse(characterAttackController.text),
                            defense: int.parse(characterDefenceController.text),
                            speed: int.parse(characterSpeedController.text));
                        characterId != null
                            ? await characterNotifier.update(chara)
                            : await characterNotifier.add(chara);
                        isSaving.value = false;
                        if (context.mounted) {
                          GoRouter.of(context).pop();
                        }
                      }
                    : null,
                icon: isLoading.value
                    ? const SizedBox.square(
                        dimension: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const SizedBox.shrink(),
                label: Text(characterId != null ? '更新する' : '登録する'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
