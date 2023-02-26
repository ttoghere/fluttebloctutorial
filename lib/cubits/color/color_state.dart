part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;
  const ColorState({
    required this.color,
  });

  factory ColorState.initial() {
    return ColorState(color: Colors.white);
  }

  @override
  List<Object?> get props => [color];

 

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
