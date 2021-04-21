# Common

## Important Key Ideas

### Versioning



### Data, Representation and Encoding independence

Everything in the interchange format should have a clear distinction between;

 * (a) the data "as a concept",
 * (b) the data "as represented" and
 * (c) the data "as encoded in a file format".

For example,

 * (a) the data being represented could be "the name of an object",
 * (b) but it could be represented as an integer pointing to a UTF-8 string
   table, and
 * (c) that could be encoded as either XML or Cap'n'Proto file format.

### On disk representation

The interchange format should define both;

 * (a) A compact binary machine readable format, **and**
 * (b) a texted based human readable format.

Tools should exist which do lossless conversion between the machine and human
readable formats.

The preferred on disk formats for the interchange format are;

 * (a) Binary Machine readable format - **Cap'n'Proto**
 * (b) Text based human readable format - **XML**

These two formats where selected because, they have;

 * A well defined schema format.
 * Good support by almost all languages, including the important languages of
   C++, Python and Java.
 * Already in use by core target tools.

While **XML** is the preferred text based format, to enable wider adoption of
the interchange format, **optional** support for *alternative* human readable
text formats is encouraged.

High value targets formats include;

 * JSON
 * YAML


#### Schemas

To make sure that files comply with the interchange specification, schemas for
the on-disk file formats which allow at least some automatic validation should
be provided.

#### Backwards Compatibility

Schema for the file formats should be extended to maintain backwards
compatibility will previous on-disk formats.

Making breaking changes in on-disk formats require a new major version of the
specification to be published.


#### Common Metadata

All files should have a set of common metadata to make it easy to connect files
together and understand their relationship.

As the file output should be deterministic, files **should** include the
details required to reproduce the file output easily.

This includes;

  * Checksum of inputs
  * Information (version, command line arguments, random seed, etc) around
    tooling used to create the file.

Should **not** include;

 * Anything which makes builds not-reproducible.
   See https://reproducible-builds.org/docs/ for common examples.


#### String Storage

 * A significant percentage of the data in all the files are strings that are
   only needed for humans.

 * These strings are frequently used for identifiers.

 * For this reason special care has been taken around both the representation
   and the on-disk encoding of these strings.



