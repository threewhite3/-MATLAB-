#include<iomanip>
#include<algorithm>
#include<iostream>
#include<vector>

using namespace std;
//Jacobi迭代法核心
void Jacobi(vector<vector<double>>A, vector<double>B, int n)
{
	vector<double>X(n, 0);   //第k次迭代，解的初始值
	vector<double>Y(n, 0);   //第k+1次迭代
	vector<double>D(n, 0);   //每次迭代后的残差
	int k = 0;  //记录循环次数
	cout << "第" << k + 1 << "次迭代结果: " << "   ";
	do
	{
		X = Y;
		for (int i = 0; i < n; i++)
		{
			double tmp = 0;
			for (int j = 0; j < n; j++)
			{
				if (i != j)
					tmp += A[i][j] * X[j];
			}
			Y[i] = (B[i] - tmp) / A[i][i];   //第k+1次迭代后的解
			cout << left << setw(8) << Y[i] << "  ";
		}
		cout << endl;
		k++;
		if (k > 100)
		{
			cout << "迭代失败！！！可能是函数不收敛" << endl;
			return;
		}

		for (int a = 0; a < n; a++)
		{
			D[a] = X[a] - Y[a];    //计算每次迭代后的残差
		}
	} while (*max_element(D.begin(), D.end()) > 0.00001 || *max_element(D.begin(), D.end()) < -0.00001); //当残差小于一定值，迭代终止
	return;
}
//int main()
//{
//	int n;
//	cout << "请输入方程组未知数的个数n:";
//	cin >> n;
//	cout << endl;
//
//	vector<vector<double>>A(n, vector<double>(n, 0));
//	vector<double>B(n, 0);
//
//	cout << "请输入方程组的系数矩阵:" << endl;
//	for (int i = 0; i < n; i++)
//	{
//		for (int j = 0; j < n; j++)
//		{
//			cin >> A[i][j];
//		}
//	}
//	cout << endl;
//
//	cout << "请输入方程组常数常量:" << endl;
//	for (int i = 0; i < n; i++)
//	{
//		cin >> B[i];
//	}
//	cout << endl;
//
//	cout << "你输入的方程组为：" << endl;
//	for (int i = 0; i < n; i++)
//	{
//		for (int j = 0; j < n; j++)
//		{
//			cout << A[i][j];
//		}
//		cout << "   " << B[i] << endl;
//	}
//	cout << endl;
//	cout << "Jacobi迭代法求解结果：" << endl;
//	Jacobi(A, B, n);
//	return 0;
//}

//Gauss-Seidel迭代法核心
void Gauseidel(vector<vector<double>>A, vector<double>B, int n)
{
	vector<double>X(n, 0);   //第k次迭代，解的初始值
	vector<double>Y(n, 0);   //第k+1次迭代
	vector<double>D(n, 0);   //每次迭代后的残差
	int k = 0;  //记录循环次数
	do
	{
		X = Y;
		cout << "第" << k + 1 << "次迭代结果: " << "   ";
		for (int i = 0; i < n; i++)
		{
			double tmp = 0;
			for (int j = 0; j < n; j++)
			{
				if (i < j)
					tmp += A[i][j] * X[j];
				else if (i > j)
					tmp += A[i][j] * Y[j];
			}
			Y[i] = (B[i] - tmp) / A[i][i];   //第k+1次迭代后的解
			cout << left << setw(8) << Y[i] << "   ";
		}
		cout << endl;
		k++;
		if (k > 100)
		{
			cout << "迭代失败！！！可能是函数不收敛" << endl;
			return;
		}

		for (int a = 0; a < n; a++)
		{
			D[a] = X[a] - Y[a];    //计算每次迭代后的残差
		}
	} while (*max_element(D.begin(), D.end()) > 0.00001 || *max_element(D.begin(), D.end()) < -0.00001); //当残差小于一定值，迭代终止
	return;
}
int main()
{
	int n;
	cout << "请输入方程组未知数的个数n:";
	cin >> n;
	cout << endl;

	vector<vector<double>>A(n, vector<double>(n, 0));
	vector<double>B(n, 0);

	cout << "请输入方程组的系数矩阵:" << endl;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cin >> A[i][j];
		}
	}
	cout << endl;

	cout << "请输入方程组常数常量:" << endl;
	for (int i = 0; i < n; i++)
	{
		cin >> B[i];
	}
	cout << endl;

	cout << "你输入的方程组为：" << endl;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << A[i][j];
		}
		cout << "   " << B[i] << endl;
	}
	cout << endl;
	cout << "Gauss-Seidel迭代法求解结果：" << endl;
	Gauseidel(A, B, n);

	cout << "\nJacobi迭代法求解结果：" << endl;
	Jacobi(A, B, n);

	return 0;
}