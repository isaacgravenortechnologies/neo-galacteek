dists: sdist wheels

sdist:
	@python3 setup.py sdist

bdist:
	@python3 setup.py bdist

wheels:
	@python3 setup.py bdist_wheel

FORCE:
build: FORCE
	@python3 setup.py build

install: build
	@python3 setup.py install

flake:
	@flake8 galacteek

tox:
	@tox -e py37

upload: dists
	twine upload --repository-url https://upload.pypi.org/legacy/ dist/*

themes:
	@python3 setup.py build_ui --tasks=themes

ui:
	@python3 setup.py build_ui

flatpak:
	flatpak-builder --force-clean --repo=flatpak-repo build-dir \
		packaging/linux/flatpak/org.flatpak.galacteek.Galacteek.yaml
