from src_tools.create_files import create_files, JavaSem5Scheme, SectionScheme


def main():

    create_files(JavaSem5Scheme(last_part_path='lab_1'), sections_schemes=[
        SectionScheme(path='media', files_suffix=''),
        SectionScheme(path='src', files_suffix='')
    ]
                 )


if __name__ == '__main__':
    main()
