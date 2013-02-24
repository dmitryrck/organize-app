# OrganizeApp

[![Build Status](https://travis-ci.org/dmitrynix/organize-app.png)](https://travis-ci.org/dmitrynix/organize-app)

## Getting started

    git clone git://github.com/dmitrynix/organize-app.git
    cd organize-app
    bundle install
    cp config/database.yml{.sample,}
    rake db:migrate
    rake db:seed
    foreman start

Go to [http://localhost:5000](http://localhost:5000), and use
`admin@example.com` with `password`.

## TODO

* Fix paginations link at tags show view;
* Use Github issue instead of README todo;
* Add screenshots;
* Add "heroku sample";

## License

OrganizeApp is released under the [MIT license](https://github.com/dmitrynix/organize-app/blob/master/LICENSE).
