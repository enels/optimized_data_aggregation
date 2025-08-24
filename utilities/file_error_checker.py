# csv file library for working with csv
import csv 


class FileErrorCheck:

    def __init__(self, __file_path):
        
        self.__file_path = __file_path
        self.__file_name = ""
        self.__file_errors = dict()

    
    def __extract_file_name(self):

        """Returns null

            Extracts the file name and set the instance file name variable
        """

        if "/" in self.__file_path:
            self.__file_name = self.__file_path.split("/")[-1]
        else:
            self.__file_name = self.__file_path

    def get_file_name(self) -> str:

        """Returns the file name

            Get the file name from the __extract_file_name method
        """

        # checks file for errors
        self.__check_file()

        # extract the file name from the file path
        # checks if file name is already set
        if self.__file_name == "":
            self.__extract_file_name()
        
        # return file name
        return self.__file_name

    def __check_file(self):

        """Returns null

            Checks file for 4 different types of errors
            - Missing file
            - Error in file
            - File character format
            - Other types of miscellaneous errors
        """


        try:
            with open(self.__file_path) as csv_file:

                csv_reader = csv.reader(csv_file, delimiter=',')

        except FileNotFoundError:
            self.__extract_file_name()
            self.__file_errors[FileNotFoundError] = "Error: The csv file with name {} cannot be \
found".format(self.__file_name)

        # check for bad file format
        except csv.Error as e:
            self.__file_errors[BadFileError] = "Error: {}".format(e)

        # check for characters that are outside the unicode system
        except UnicodeDecodeError:
            self.__file_errors[UnicodeDecodeError] = "Error: file contains illegal character"


        # Miscellaneuos errors
        except Exception as e:
            self.__file_errors[MiscError] = "Error: Unexpected error in file {}".format(e)
    
    def get_file_errors(self):

        """
            Return the file error dictionary
        """

        return self.__file_errors
