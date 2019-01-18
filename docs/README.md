# Reference manual of pico-Céu

The Reference Manual of pico-Céu uses MkDocs:

[http://www.mkdocs.org/](http://www.mkdocs.org/)

## Installing mkdocs and its dependencies

```
sudo apt install fonts-lmodern
sudo apt install lmodern
sudo apt install pandoc
sudo apt install texlive-base
sudo apt install texlive-latex-extra
sudo apt install texlive-fonts-recommended
sudo apt install texlive-fonts-extra
sudo apt install texlive-latex-recommended
sudo apt install texlive-latex-base

sudo apt install python-pip

pip install mkdocs

pip install markdown
pip install markdown-include
pip install mkdocs-pandoc
```

## Updating the reference manual

Every version of pico-Céu has its own reference manual, which is stored in a folder prefixed by "v". All content can be updated using the markdown files located at ```docs/manual/v[VERSION]/docs```.

The reference manual sections are defined in the file ```docs/manual/v[VERSION]/mkdocs.yml```, in which we can specify the name of the section ("Introduction", for example) and the file path of its content. Note that the ```docs``` folder should not be included in the file path.
```
pages:
    - Introduction:         'index.md'
    - Graphics:             'graphics/index.md'
``` 

The ```docs/manual/index.md``` should contain a list of the reference manuals versions available, and need to be maintained manually.

## Generating a new release of reference manual
After updating the markdown files and sections, you can generate a new release of the reference manual in pdf, markdown and html formats simply navigating to ```docs/``` folder and running ```make``` (passing the pico-Céu version). Below, there is an example of generating the reference manual for pico-Céu 0.40:
```
make VERSION=v0.40
```

mkdocs and pandoc will create the finals pdf and markdown at ```docs/manual/v[VERSION]/```. The html will be created at ```docs/out/v[VERSION]/```. This folder should store all versions of the reference manual, and its content will automatically be displayed on the reference manual website (if at master branch). Also in the Makefile, the ```docs/manual/index.md``` is converted to ```docs/out/index.html```.

## Links
- [ImportError: Failed loading extension 'markdown_include' from 'markdown_include', 'markdown.extensions.markdown_include' or 'mdx_markdown_include'](https://github.com/mkdocs/mkdocs/issues/777)
- [mkdocs-pandoc](https://github.com/jgrassler/mkdocs-pandoc)
