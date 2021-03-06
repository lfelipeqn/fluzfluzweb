<?php
/**
 * The MIT License (MIT)
 * 
 * Copyright (c) 2011-2014 BitPay
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
	
include(dirname(__FILE__).'/../../config/config.inc.php');
include(dirname(__FILE__).'/../../header.php');
include(dirname(__FILE__).'/bitpay.php');


$bitpay = new bitpay();

$handle = fopen('php://input','r');
$jsonInput = fgets($handle);

if(function_exists('json_decode'))
{
    $decoded = json_decode($jsonInput, true);
}
else
{
    $decoded = rmJSONdecode($jsonInput);
}

fclose($handle);

if(function_exists('json_decode'))
{
    $posData = json_decode($decoded['posData']);
}
else
{
    $posData = rmJSONdecode($decoded['posData']);
}

$invoice_bitpay = $bitpay->get_invoice($decoded['id']);

if($invoice_bitpay !== false)
{
    $order = (int)Order::getOrderByCartId($posData->cart_id);
    if ($posData->hash == crypt($posData->cart_id, Configuration::get('bitpay_APIKEY')))
    {	

        if (in_array($decoded['status'], array('paid', 'confirmed', 'complete')))
        {

            if($decoded['status'] == 'paid')
            {
                $status_bitpay = Configuration::get('PS_OS_PREPARATION');
            }
            else 
            {
                $status_bitpay = Configuration::get('PS_OS_PAYMENT');
            }

            if ($order == 0)
            {
                $key = $posData->key;
                $bitpay->validateOrder($posData->cart_id, $status_bitpay, $invoice_bitpay['price'], $bitpay->displayName, null, array(), null, false, $key);
                $bitpay->writeDetails($bitpay->currentOrder, $posData->cart_id, $invoice_bitpay['id'], $invoice_bitpay['status']);
            }
            else 
            {
                if (empty(Context::getContext()->link))
                {
                    Context::getContext()->link = new Link(); // workaround a prestashop bug so email is sent 
                }
                $key = $posData->key;
                $order = new Order((int)Order::getOrderByCartId($posData->cart_id));
                $new_history = new OrderHistory();
                $new_history->id_order = (int)$order->id;
                $order_status = (int)$status_bitpay;
                $new_history->changeIdOrderState((int)$order_status, $order, true);
                $new_history->addWithemail(true);
            }
        }
    }
    else 
    {
        bplog('Hash does not match');
    }
}