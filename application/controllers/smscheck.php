<?php 

        //Please Enter Your Details
        $user="OGORBZ"; //your username 
        $password="12345"; //your password 
        // $mobilenumbers="9539992865"; //enter Mobile numbers comma seperated 
        // $message = "Dear ANGEO, your One time password is 12345"; //enter Your Message 
        $senderid="OGOENT";  //Your senderid
        $url="http://sapteleservices.com/SMS_API/sendsms.php"; 
                $message = urlencode($message); 
                $ch = curl_init(); 
                if (!$ch) 
                        { 
                                die("Couldn't initialize a cURL handle"); 
                        } 

                curl_setopt($ch, CURLOPT_URL,$url); 
                curl_setopt ($ch, CURLOPT_POST, 1); 
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); 
                curl_setopt ($ch, CURLOPT_POSTFIELDS,"username=$user&password=$password&mobile=$mobilenumbers&message=$message&sendername=$senderid&routetype=1"); 
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                
                  $data = curl_exec($ch);
                    curl_close($ch);

                        ?>