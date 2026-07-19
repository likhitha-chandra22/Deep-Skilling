using NUnit.Framework;
using CollectionsLib;
using System.Linq;

namespace CollectionsLib.Tests
{
    [TestFixture]
    public class EmployeeManagerTests
    {
        private EmployeeManager employeeManager;

        [SetUp]
        public void Initialize()
        {
            employeeManager = new EmployeeManager();
        }

        // Scenario 1
        [Test]
        public void EmployeesList_ShouldNotContainNullValues()
        {
            var employeeList = employeeManager.GetEmployees();

            Assert.That(employeeList.All(emp => emp != null), Is.True);
        }

        // Scenario 2
        [Test]
        public void EmployeesList_ShouldContainEmployeeWithId100()
        {
            var employeeList = employeeManager.GetEmployees();

            Assert.IsTrue(employeeList.Any(emp => emp.EmpId == 100));
        }

        // Scenario 3
        [Test]
        public void EmployeesList_ShouldHaveUniqueEmployeeIds()
        {
            var employeeList = employeeManager.GetEmployees();

            var totalCount = employeeList.Count;
            var uniqueCount = employeeList.Select(emp => emp.EmpId).Distinct().Count();

            Assert.AreEqual(totalCount, uniqueCount);
        }

        // Scenario 4
        [Test]
        public void PreviousYearEmployees_ShouldMatchCurrentEmployeeIds()
        {
            var currentEmployees = employeeManager.GetEmployees();
            var previousEmployees = employeeManager.GetEmployeesWhoJoinedInPreviousYears();

            CollectionAssert.AreEquivalent(
                currentEmployees.Select(emp => emp.EmpId),
                previousEmployees.Select(emp => emp.EmpId)
            );
        }
    }
}