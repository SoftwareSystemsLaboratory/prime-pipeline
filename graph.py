import matplotlib.pyplot as plt
import pandas
from pandas import DataFrame
from argparse import ArgumentParser, Namespace

def getArgs()   -> Namespace:
    parser: ArgumentParser = ArgumentParser(prog="TEMP GRAPHER")
    parser.add_argument("-i", help="INPUT")
    parser.add_argument("-o", help="OUTPUT")
    return parser.parse_args()

def plot(data: DataFrame, filename: str)    ->  None:
    plt.style.use("style.mplstyle")
    xData = data.iloc[:, 0]
    yData = data.iloc[:, 1]
    plt.plot(xData, yData)
    plt.savefig(filename)

if __name__ == "__main__":
    args: Namespace = getArgs()
    try:
        df: DataFrame = pandas.read_json(args.i)
    except ValueError:
        print(args)
        exit()
    plot(data=df, filename=args.o)
