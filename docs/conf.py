#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (C) 2017-2022  F4PGA Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

# Updated documentation of the configuration options is available at
# https://www.sphinx-doc.org/en/master/usage/configuration.html

from re import sub as re_sub
from os import path as os_path, environ, popen
from sys import path as sys_path

sys_path.insert(0, os_path.abspath('.'))

# -- General configuration ------------------------------------------------

project = 'FPGA Interchange Format'
copyright = '2022, F4PGA Developers'
author = 'F4PGA Developers'

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.doctest',
    'sphinx.ext.imgmath',
    'sphinx.ext.intersphinx',
    'sphinx.ext.napoleon',
    'sphinx.ext.todo',
    'sphinx_markdown_tables',
    'recommonmark',
]

templates_path = ['_templates']

source_suffix = ['.rst', '.md']

master_doc = 'index'

on_rtd = environ.get('READTHEDOCS', None) == 'True'

if on_rtd:
    docs_dir = os_path.abspath(os_path.dirname(__file__))
    print("Docs dir is:", docs_dir)
    import subprocess
    subprocess.call('git fetch origin --unshallow', cwd=docs_dir, shell=True)
    subprocess.check_call('git fetch origin --tags', cwd=docs_dir, shell=True)

release = re_sub('^v', '', popen('git describe').read().strip())
version = release

language = None

exclude_patterns = [
    '_build',
    'env',
    'Thumbs.db',
    '.DS_Store'
]

pygments_style = 'default'

todo_include_todos = True

# -- Options for HTML output ----------------------------------------------

html_theme = 'sphinx_symbiflow_theme'

html_theme_options = {
    'repo_name': 'chipsalliance/fpga-interchange-schema',
    'github_url': 'https://github.com/chipsalliance/fpga-interchange-schema',
    'color_primary': 'indigo',
    'color_accent': 'blue',
}

html_static_path = ['_static']

# -- Options for HTMLHelp output ------------------------------------------

htmlhelp_basename = 'fpga-interchange-schema'

# -- Options for LaTeX output ---------------------------------------------

latex_elements = {}

latex_documents = [
    (
        master_doc,
        'fpga-interchange-schema.tex',
        u'FPGA Interchange Format Documentation',
        u'F4PGA Developers',
        'manual',
    ),
]

# -- Options for manual page output ---------------------------------------

man_pages = [
    (
        master_doc,
        'fpga-interchange-schema',
        u'FPGA Interchange Format Documentation',
        [author],
        1,
    ),
]

# -- Options for Texinfo output -------------------------------------------

texinfo_documents = [
    (
        master_doc,
        'FPGAIFM',
        u'FPGA Interchange Format Documentation',
        author,
        'FPGAFIF',
        'One line description of project.',
        'Miscellaneous',
    ),
]

# -- Sphinx.Ext.InterSphinx -----------------------------------------------

intersphinx_mapping = {
    "python": ("https://docs.python.org/3/", None),
}
