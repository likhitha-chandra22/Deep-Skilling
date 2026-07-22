import EmployeeCard from './EmployeeCard';

function EmployeesList(props) {

    return (

        <div>

            <h1>Employees List</h1>

            {

                props.employees.map(employee =>

                    <div key={employee.id}>
                        {employee.name}
                    </div>

                )

            }

        </div>

    );

}

export default EmployeesList;