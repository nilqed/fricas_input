.. status: ok


13.8 Add Domain
---------------

The capsule part of Implementation defines functions that implement the
operations exported by the domain---usually only some of the operations.
In our demo in `ugDomainsDemo <section-13.4.html#ugDomainsDemo>`__ we
asked for the value of 3*q-q+q. Where do the operations *, +, and -
come from? There is no definition for them in the capsule!

The Implementation part of a definition can domain:add optionally
specify an add-domain to the left of an add add (for QuadraticForm,
defines SquareMatrix(n,K) is the add-domain). The meaning of an
add-domain is simply this: if the capsule part of the Implementation
does not supply a function for an operation, FriCAS goes to the
add-domain to find the function. So do *, + and - (from QuadraticForm)
come from SquareMatrix(n,K)?



