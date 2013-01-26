from fabric.api import local, cd, get, env, roles, execute, task
from fabric.colors import green
from glob import iglob
from os import path


# paths
# base_path = "www/resources/css"
ggs_path = "./ggs/css"
ggs_scss_path = ggs_path + "/src"
ggs_2_path = "./ggs-2/css"
ggs_2_scss_path = ggs_2_path + "/src"
frameless_path = "./frameless/css"
frameless_scss_path = frameless_path + "/src"

# desktop_scss_path   = base_path + "/src-desktop"
# desktop_css_path    = base_path + "/desktop"
# desktop_scss_format = base_path + "/src-desktop/{}.scss"
# desktop_css_format  = base_path + "/desktop/{}.css"

# mobile_scss_path   = base_path + "/src-mobile"
# mobile_css_path    = base_path + "/mobile"
# mobile_scss_format = base_path + "/src-mobile/{}.scss"
# mobile_css_format  = base_path + "/mobile/{}.css"

#regx
match_scss = "{}/[a-zA-Z]*.scss"

# sass run execs
# exec_sass_watch = "sass -l --watch {}:{} {}:{}"
exec_sass_watch = "sass -l --watch {}:{}"
exec_sass_compile = "sass --force --style compressed {} {}"


@task
def watch():
    """
    start a scss "watch" process on the css src files
    """
    # local(exec_sass_watch
    #     .format(
    #         desktop_scss_path,
    #         desktop_css_path,
    #         mobile_scss_path,
    #         mobile_css_path
    #     )
    # )
    local(exec_sass_watch
        .format(
            ggs_scss_path,
            ggs_path,
        )
    )


@task
def watch2():
    """
    start a scss "watch" process on the css src files
    """
    local(exec_sass_watch
        .format(
            ggs_2_scss_path,
            ggs_2_path
        )
    )

@task
def watch_frameless():
    """
    start a scss "watch" process on the css src files
    """
    local(exec_sass_watch
        .format(
            frameless_scss_path,
            frameless_path
        )
    )


@task
def compile():
    """
    compile scss -> css; returns an array of css file paths
    """

    print(green("\n[CSS] Compiling CSS\n", bold=True))

    # desktop_glob = iglob(match_scss.format(desktop_scss_path))
    # mobile_glob = iglob(match_scss.format(mobile_scss_path))
    # css_file_list = []

    # for i in desktop_glob:
    #     file_name = path.basename(i)
    #     file_name = path.splitext(file_name)[0]
    #     scss_file = desktop_scss_format.format(file_name)
    #     css_file  = desktop_css_format.format(file_name)

    #     local(exec_sass_compile.format(scss_file, css_file))
    #     css_file_list.append(css_file)

    # for i in mobile_glob:
    #     file_name = path.basename(i)
    #     file_name = path.splitext(file_name)[0]
    #     scss_file = mobile_scss_format.format(file_name)
    #     css_file  = mobile_css_format.format(file_name)

    #     local(exec_sass_compile.format(scss_file, css_file))
    #     css_file_list.append(css_file)

    # return css_file_list


@task
def list():
    """
    returns an array of css file paths
    """

    # print(green("\n[CSS] Getting CSS List\n", bold=True))

    # desktop_glob = iglob(match_scss.format(desktop_scss_path))
    # mobile_glob = iglob(match_scss.format(mobile_scss_path))

    # css_file_list = []

    # for i in desktop_glob:
    #     file_name = path.basename(i)
    #     file_name = path.splitext(file_name)[0]
    #     css_file  = desktop_css_format.format(file_name)

    #     css_file_list.append(css_file)

    # for i in mobile_glob:
    #     file_name = path.basename(i)
    #     file_name = path.splitext(file_name)[0]
    #     css_file  = mobile_css_format.format(file_name)

    #     css_file_list.append(css_file)

    # print css_file_list
    # return css_file_list
