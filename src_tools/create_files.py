from abc import ABC
from typing import Pattern
import re
from pathlib import Path

from pydantic import BaseModel, DirectoryPath, Field, constr


def replace_dash_with_underscore(file_name: str) -> str:
    """
    Замена "-" на "_"
    """
    pattern: Pattern[str] = re.compile(r"-")
    string: str = file_name
    replace: str = "_"

    return re.sub(pattern, replace, string)


class PathBaseScheme(BaseModel, ABC):
    last_part_path: constr(regex=None)
    path_common: DirectoryPath


class Sem5Scheme(PathBaseScheme):
    path_common: DirectoryPath = Path('sem_5')


class JavaSem5Scheme(PathBaseScheme):
    path_common: DirectoryPath = Path('sem_5/java/labs')


class SectionScheme(BaseModel):
    path: DirectoryPath
    files_suffix: str = Field(default='',
                              description="Расширение для файлов в директории. Если указано '' (по умолчанию), "
                                          "значит без расширения. Н: .py .md ")


def create_files(path_scheme: PathBaseScheme,
                 sections_schemes: list[SectionScheme] = (
                         SectionScheme(path='docs', files_suffix=''),
                         SectionScheme(path='media', files_suffix=''),
                         SectionScheme(path='src', files_suffix='')
                 )
                 ) -> bool:
    common_path: Path = path_scheme.path_common.joinpath(
        replace_dash_with_underscore(path_scheme.last_part_path)
    )

    for section_scheme in sections_schemes:
        completed_path: Path = section_scheme.path.joinpath(common_path).with_suffix(
            section_scheme.files_suffix)

        completed_path.parent.mkdir(parents=True, exist_ok=True)
        if not section_scheme.files_suffix:
            try:
                completed_path.mkdir(exist_ok=False)
            except FileExistsError:
                raise
        else:
            try:
                completed_path.touch(exist_ok=False)
            except FileExistsError:
                raise

    return True


def main():
    pass


if __name__ == '__main__':
    main()
