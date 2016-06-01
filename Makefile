all: 	
	elm make --yes src/Demo.elm --output=index.html --warn


clean:
	rm -rf elm-stuff index.html
