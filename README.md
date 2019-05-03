# Gambol Online Sportsbetting Application
This is a repository of my Flatiron School Sinatra project. It is a username & password login domain that allows users to create betting lists, populate them with various sportsbetting propositions (game winners, totals, etc.) and track them. A user can have many lists of props. A list belongs to a user and cannot be edited by other users.

Additionally, the application allows for an administrator to create props that other users can bet on. Only the administrator has this access to create propositions. Only an administrator can make other users an administrator as well. If the database is empty, as is at the start of the application, the first user successfully created will be an administrator. This user cannot accidentally change their administrator privileges.

The project uses Helper methods to restrict the navigation bar and elements in the pages.

There is extensive use of CSS, but in cases where centering or beautifying displayed text was not necessary, complex code was avoided and instead focused on completing the project.

## Specifications for the Sinatra Assessment
https://github.com/veloblank/gambol-sinatra-project/blob/master/spec.md

## Usage

The project is usable in its current form on its master branch. It can be cloned or forked to a local machine. Run bundle install to update all gems and use 'shotgun' to start a local server. The application can be accessed at its root '/'.

## Contributing

Bug reports and contributions via raised issues and pull requests are welcomed on GitHub at https://github.com/veloblank/gambol-sinatra-project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to a [Contributor Covenant](https://github.com/veloblank/gambol-sinatra-project/blob/master/CONTRIBUTING.md) code of conduct.

## Developer Disclaimer

This project is not intended to promote wagering on the outcomes of sports or other events. It is intended to be an educational project for object-oriented programming as well as MVC application development. Propositions in the application, while partly-based on real events and real data, are not intended to encourage wagering on those events, nor sportsbetting in general.

## License

MIT License
Copyright (c) 2018 John Blank

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
