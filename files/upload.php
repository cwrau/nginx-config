<?php
	if (!file_exists('dropin')) {
		mkdir('dropin', 0777, true);
	}
	foreach (array_keys($_FILES) as $key) {
		echo ($_FILES[$key]['name'] . ":\n");
		$hash = hash_file('sha512', $_FILES[$key]['tmp_name']);
		$basename = pathinfo($_FILES[$key]['name'], PATHINFO_FILENAME);
		$extension = pathinfo($_FILES[$key]['name'], PATHINFO_EXTENSION);

		if (!empty($basename) && !empty($extension)) {
			$fileName = "dropin/${basename}_${hash}.${extension}";
		} else if (!empty($extension)) {
			$fileName = "dropin/${hash}.${extension}";
		} else {
			$fileName = "dropin/${hash}";
		}

		if (!file_exists($fileName)) {
			move_uploaded_file($_FILES[$key]["tmp_name"], $fileName);
		}
		echo "$fileName\n\n";
	}
?>