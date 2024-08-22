import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/puzzle_piece.dart';

class PuzzleGamePage extends StatefulWidget {
  const PuzzleGamePage({super.key, required this.id});

  final int id;

  @override
  State<PuzzleGamePage> createState() => _PuzzleGamePageState();
}

class _PuzzleGamePageState extends State<PuzzleGamePage> {
  List<int> pieces = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // int? firstSelectedIndex;

  // void swapValues(int firstIndex, int secondIndex) {
  //   setState(() {
  //     try {
  //       int temp = pieces[firstIndex];
  //       pieces[firstIndex] = pieces[secondIndex];
  //       pieces[secondIndex] = temp;
  //       firstSelectedIndex = null;
  //     } catch (e) {
  //       log(e.toString());
  //     }
  //   });
  // }

  bool started = false;

  void onShuffle() {
    setState(() {
      started = true;
      pieces.shuffle();
    });
  }

  void onPuzzle(int id) {
    // if (firstSelectedIndex == null) {
    //   firstSelectedIndex = id;
    // } else {
    //   if (id == firstSelectedIndex) return;
    //   swapValues(firstSelectedIndex!, id);
    // }

    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bg: started ? widget.id : 3,
      started: started,
      body: Stack(
        children: [
          const ArrowButton(),
          Column(
            children: [
              SizedBox(height: 40 + getStatusBar(context)),
              Center(
                child: Text(
                  started ? '' : 'Puzzles',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontFamily: Fonts.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                started ? '' : getPuzzleName(widget.id),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[0],
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[1],
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[2],
                    onPressed: onPuzzle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[3],
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[4],
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[5],
                    onPressed: onPuzzle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[6],
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[7],
                    onPressed: onPuzzle,
                  ),
                  const SizedBox(width: 8),
                  PuzzlePiece(
                    id: widget.id,
                    puzzleID: pieces[8],
                    onPressed: onPuzzle,
                  ),
                ],
              ),
              if (!started) ...[
                const SizedBox(height: 53),
                PrimaryButton(
                  title: 'Shuffle',
                  onPressed: onShuffle,
                ),
                const SizedBox(height: 21),
                const Text(
                  'When you press the\nShuffle button, the game\nwill start.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
