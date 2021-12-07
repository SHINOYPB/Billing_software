<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
* SMS Library file
*/
class Msg91 {
	public function __construct () {
		$this->ci =& get_instance();
        $this->username = "OGORBZ";
        $this->password = "12345";
        $this->senderid = "OGOENT";
	}
    /**
     * This function helps to check the balance using the authentication key provided by MSG91.com
     * Function: checkSMSBalance()
     * Author: Anbuselvan Rocky
     */
    
    public function checkSMSBalance()
    {
        
        $curl = curl_init();
        curl_setopt_array($curl, array(
          CURLOPT_URL => "http://sapteleservices.com/SMS_API/sendsms.php",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "GET",
          CURLOPT_SSL_VERIFYHOST => 0,
          CURLOPT_SSL_VERIFYPEER => 0,
        ));
        $balance = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
          return "cURL Error #:" . $err;
        } else {
          return $balance;
        }
    }    
    public function send($to, $message) 
    {
        // Check SMS Balance, if it has credit. It will send the message with $to, $message parameters.
        // if (!$this->checkSMSBalance() >= 1) {
        //     return false;   
        // }
        // else
        // {
            //Your message to send, Add URL encoding here.
            $message = urlencode($message);
            //Define route
            $route = "1";
            $username = $this->username;
            $password = $this->password;
            $senderid = $this->senderid;
            //Prepare you post parameters      
            //API URL
            $url="http://sapteleservices.com/SMS_API/sendsms.php";
            // init the resource
            $ch = curl_init();
            if (!$ch){ 
                    die("Couldn't initialize a cURL handle"); 
                }
                curl_setopt($ch, CURLOPT_URL,$url);
                curl_setopt ($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
                curl_setopt ($ch, CURLOPT_POSTFIELDS,"username=$username&password=$password&mobile=$to&message=$message&sendername=$senderid&routetype=1"); 
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $data = curl_exec($ch);
                    curl_close($ch);
        // }
    }
}
?>