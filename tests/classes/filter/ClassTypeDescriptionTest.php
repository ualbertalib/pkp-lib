<?php

/**
 * @file tests/classes/filter/ClassTypeDescriptionTest.php
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2000-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class ClassTypeDescriptionTest
 * @ingroup tests_classes_filter
 * @see ClassTypeDescription
 *
 * @brief Test class for ClassTypeDescription.
 */

import('lib.pkp.tests.PKPTestCase');
import('lib.pkp.classes.filter.ClassTypeDescription');
import('lib.pkp.tests.classes.filter.TestClass1');
import('lib.pkp.tests.classes.filter.TestClass2');

class ClassTypeDescriptionTest extends PKPTestCase {
	/**
	 * @covers ClassTypeDescription
	 */
	public function testInstantiateAndCheck() {
		$typeDescription = new ClassTypeDescription('lib.pkp.tests.classes.filter.TestClass1');
		$compatibleObject = new TestClass1();
		$wrongObject = new TestClass2();
		self::assertTrue($typeDescription->isCompatible($compatibleObject));
		self::assertFalse($typeDescription->isCompatible($wrongObject));
	}

	/**
	 * @covers ClassTypeDescription
	 */
	function testInstantiateWithInvalidTypeDescriptor1() {
		// An unknown type name will cause an error.
		$this->expectError();
		$typeDescription = new ClassTypeDescription('ClassWithoutPackage');
	}
}

