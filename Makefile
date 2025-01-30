clean:
	fvm flutter clean

get:
	fvm flutter pub get

prepare:
	make clean
	make get

format:
	fvm dart format -l 120 .

build_runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

run:
	fvm flutter run
