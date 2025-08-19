# csv file library for working with csv
import csv 


class FileErrorCheck:

    def __init__(self, __file_path):
        
        self.__file_path = __file_path
        self.__file_name = ""
        self.__file_errors = dict()

    
    def __extract_file_name(self):

        """
            Extracts the file name
        """

        if "/" in self.__file_path:
            self.__file_name = self.__file_path.split("/")[-1]
        else:
            self.__file_name = self.__file_path

    def get_file_name(self):

        # checks file for errors
        self.__check_file()

        # extract the file name from the file path
        # checks if file name is already set
        if self.__file_name == "":
            self.__extract_file_name()
        
        # return file name
        return self.__file_name

    def __check_file(self):


        try:
            with open(self.__file_path) as csv_file:

                csv_reader = csv.reader(csv_file, delimiter=',')

        except FileNotFoundError:
            self.__extract_file_name()
            self.__file_errors["Error: The csv file with name {} cannot be found".format(self.__file_name)] = True

        # check for bad file format
        except csv.Error as e:
            self.__file_errors["Error: {}".format(e)] = True

        # check for characters that are outside the unicode system
        except UnicodeDecodeError:
            self.__file_errors["Error: file contains illegal character"] = True


        # Miscellaneuos errors
        except Exception as e:
            self.__file_errors["Error: Unexpected error in file {}".format(e)] = True
    
    def get_file_errors(self):

        return self.__file_errors
