all: 	
	elm make --yes src/Demo.elm --output=index.html #--warn

elm-test:
	true
clean:
	rm -rf elm-stuff index.html
