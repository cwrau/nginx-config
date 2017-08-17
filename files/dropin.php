<?php
	foreach (array_keys($_FILES) as $key) {
		if ($_FILES[$key]['size']) {
			echo ($_FILES[$key]['name'] . ": ");
			$hash = hash_file('sha512', $_FILES[$key]['tmp_name']);
			$fileName = "dropin/$hash";
			if (!file_exists($fileName)) {
				move_uploaded_file($_FILES[$key]["tmp_name"], $fileName);
			}
			echo "SHA-512: $hash";
		}
	}
?>