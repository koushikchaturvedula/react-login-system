import { useEffect, useState } from 'react';
import { CartesianGrid, Line, LineChart, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts';
import { get } from './Services/api.service';
import { User } from './Utils/types';



export const Chart = () => {

  const [chartWidth, setChartWidth] = useState(0);
  const [chartHeight, setChartHeight] = useState(0);
  const [users, setUsers] = useState<User[]>([]);

  useEffect(() => {
    const screenWidth = window.innerWidth;
    const screenHeight = window.innerHeight;
    setChartWidth(screenWidth * 0.8);
    setChartHeight(screenHeight * 0.6);
  }, []);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        get("employee").then((res: any) => {
          setUsers(res);
        })
      } catch (error) {
        console.error(error);
      }
    };

    fetchUsers();
  }, []);

  const getJoinedByYear = (data: any) => {
    const result = [];
    const currentYear = new Date().getFullYear();

    for (let i = 0; i < 10; i++) {
      const year = currentYear - i;
      const employeesJoined = data.filter((employee: any) => {
        return new Date(employee.joined_date).getFullYear() === year;
      }).length;
      result.unshift({ year: year, employees: employeesJoined });
    }

    return result;
  };
  const chartData = getJoinedByYear(users);

  const formatYTick = (tickValue: any) => {
    return Math.round(tickValue);
  };

  return (
    <ResponsiveContainer width={chartWidth} height={chartHeight}>
      <LineChart width={1200} height={800} data={chartData} >
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="year" label={{ value: 'Year', position: 'insideBottomCenter' }} dy={10} />
        <YAxis allowDecimals={false} label={{ value: 'Employee', angle: -90, position: 'insideLeft', }} />
        <Tooltip />
        {/* <Legend /> */}
        <Line type="monotone" dataKey="employees" stroke="#8884d8" activeDot={{ r: 8 }} />
      </LineChart>
    </ResponsiveContainer>

  );
}
