# CVE-2021-29440
Unsafe Twig processing of static pages leading to RCE in Grav CMS 1.7.10

- Grav is a file based Web-platform. Twig processing of static pages can be enabled in the front matter by any administrative user allowed to create or edit pages. As the Twig processor runs unsandboxed, this behavior can be used to gain arbitrary code execution and elevate privileges on the instance. 

## Explanation
- You need a user who has access to /admin dashboard with page creation privileges.
- Front matter block supports a directive named **process.twig**, which will apply a Twig rendering pass on the content before serving the page.
- While this behavior is disabled by default, users with basic page creation privileges enable this feature in the front matter
- We create a page with content `{{ system("id") }}` and then enabling twig rendering : `Advanced --> Process --> Twig (enable)`
- Visiting the created page to see the output of our command

## Usage
- Edit the username, password and url variable and then run the script
```bash
python3 exploit.py
```

## Environment
- Run environment.sh to setup Grav CMS 1.7.10 on apache.

## Credits
- https://blog.sonarsource.com/grav-cms-code-execution-vulnerabilities


