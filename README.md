# wp-plugin-starter
A util to quickly generate a minimalist plugin skeleton to ease the process of creating a new custom WordPress plugin.

## About

This is a helper project to "help" me quickly generate the bare minimum of a custom WordPress plugin skeleton. In the process, if it can help you too, I would be honored.

By adjusting some specific details for the intended custom plugin via [this environment file aka the `plugin-env` file](plugin-env.sh), you are good to go with a plugin ready to be activated (although it will not do much at that point obviously).

The plugin template skeleton has been devised to adhere closely to [the WordPress plugin guidelines](https://developer.wordpress.org/plugins/wordpress-org/detailed-plugin-guidelines/) - thus increasing its odds of getting accepted to be listed on the WordPress-dot-ORG plugin directory, if your aim is to make it available there.

## How To Use

Steps:

1) Adjust the details of the plugin in the [plugin-env.sh file](plugin-env.sh)

    - Make sure you choose a unique slug for your plugin. Search for that slug [on the public WordPress plugin directory](https://wordpress.org/plugins/) to make sure it has not already been taken.
    - Do not prefix your **slug** or plugin's **display name** with either of the keywords `wp` or `wordpress` - because these are restricted terms imposed by the **WordPress Plugin Review Team**.
    - Your **display name** or **slug** should not have the keyword `wordpress` because it is against the [WordPress Trademark policy](https://wordpressfoundation.org/trademark-policy/).

2) Execute the generation command:

```bash
$ bin/100-spin-new-plugin.sh
```

3) Execute the composer install command:

```bash 
$ bin/200-composer-install.sh
```

4) Adjust the remaining "todo" manually in the two files: `template.php` (which would be renamed to your-plugin-slug.php) and `readme.txt` files respectively.
    - e.g the plugin's description, tags.etc
    - and any default values


Voila! You are done! Happy coding!

## Contributing ##

The best way to contribute to the development of this plugin is by participating on the GitHub project:

[https://github.com/wkhayrattee/wp-plugin-starter](https://github.com/wkhayrattee/wp-plugin-starter)

There are many ways you can contribute:

* Raise an issue if you found one
* Create/send us a Pull Request with your bug fixes and/or new features
* Provide us with your feedback and/or suggestions for any improvement or enhancement
* Testing - unit testing by writing & submitting test cases
* Translation - this is an area we are yet to do
