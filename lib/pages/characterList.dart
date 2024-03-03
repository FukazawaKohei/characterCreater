import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:character_creater/providers/character.dart';

class CharacterList extends HookConsumerWidget {
  CharacterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterProvider);
    final characterNotifier = ref.read(characterProvider.notifier);
    final isLoading = useState<bool>(true);

    useEffect(
      () {
        characterNotifier.getAll().then((_) => isLoading.value = false);
        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('キャラクター一覧'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              GoRouter.of(context).push('/edit');
            },
          ),
        ],
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : characterList.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sticky_note_2_outlined, size: 42),
                      SizedBox(height: 10),
                      Text('No character...')
                    ],
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(height: 1);
                  },
                  itemCount: characterList.length,
                  itemBuilder: (context, index) {
                    final character = characterList[index];
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/edit', extra: character.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              character.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Lv: ${character.level.toString()} HP: ${character.maxHp.toString()} MP: ${character.maxMp.toString()} 攻撃力: ${character.attack.toString()} 防御力: ${character.defense.toString()} 素早さ: ${character.speed.toString()}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
