# rpms

## Creating a non-root buildroot
Used to build packages as a normal user.

```
yum install -y rpmdevtools
```

Run:
```
rpmdev-setuptree
```

to create the ~/rpmbuild/ directory where packages are built.

## Creating an example spec file
```
cd ~/rpmbuild/SPECS
rpmdev-newspec python-antigravity
```

The Group and BuildRoot tags are deprecated. The %clean and %defattr are
deprecated.

Add the %check section between the sections %build and %install in the spec file
if you want to run `make test`

## Building a package
```scala
cd ~/rpmbuild/SPECS
rpmbuild -ba python-antigravity.spec
```

## Testing a package
```
rpmlint -i package.spec
```

## Testing a package with Mock
```
rpmbuild -bs package.spec # creates a src rpm

mock -r <config> <src rpm>
```
