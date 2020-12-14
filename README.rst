# Parachute

A Nimble module when you need a parachute !

This is a simple Nimble module that uses that uses `tag tracking <https://nim-lang.org/docs/manual.html#effect-system-tag-tracking>`_ to track usage of ``addr``, ``cast``, ``unsafeAddr``.

It also defines ``unsafe`` template that simple ``{.push: tags[Unsafe].}`` to the scope.

# Usage

Parachute defines ``castTag``, ``addrTag`` and ``unsafeAddrTag``, that simply calls the ``system``version while adding ``tags: [Unsafe]``.
After that, it is trivial to allow/forbid tags at compile time.

## Working with existing codebase

To avoid having to change too much your code, there is a small macro ``openParachute()`` which declare ``addr`` and ``unsafeAddr`` as templates.
Since ``addr`` cannot be overloaded, it will have to be excluded from ``system``.

In short, if you want to use the tagged version of ``addr`` and ``unsafeAddr`` do the following in your file :

```nim
import system except addr
import parachute
openParachute
```

This way of doing things avoid exporting ``addr``and ``unsafeAddr`` identifier that would potentially collide.

## Vanilla API

Otherwise, using the "vanilla" of the module can be changed easily with sed (just make sure you won't break anything else beforehand)

* ``sed -i "s/unsafeAddr/unsafeAddrTag"``
* ``sed -i "s/addr/addrTag"``

## The special case of ``cast``

Since ``cast`` is a keyword of the language, it cannot be replaced or used as an identifier.
This means that for use the tagged version of cast you have to explicitly call ``castTag``.

But since ``cast`` is most often called in conjonction with ``addr`` or ``unsafeAddr``, it should be too impactful.

# Documentations and examples

The documentation is accessible `here <https://clonkk.github.io/parachute/>`_ .

Look into the ``tests/`` folder for more elaborate examples.
