import pandas as pd
from pandarallel import pandarallel
pandarallel.initialize(progress_bar=True)

pd.set_option('display.float_format', '{:.10f}'.format)

df_pve = pd.read_csv("CO26-Dipole-pve.dat", delim_whitespace=True, names=["r", "+ve"])
df_nve = pd.read_csv("CO26-Dipole-nve.dat", delim_whitespace=True, names=["r", "-ve"])

df_pve = df_pve.drop_duplicates()
df_nve = df_nve.drop_duplicates()

df = pd.merge(df_pve, df_nve, on="r", how="left")
df["mu"] = 2.54174691*(df["+ve"] - df["-ve"])/(4e-4)

df = df.to_string(index=False, header=False)
outputFile = "CO26-Dipole.dat"
with open(outputFile, "w+") as FileToWriteTo:
    FileToWriteTo.write(df)