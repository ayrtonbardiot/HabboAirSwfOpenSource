﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.communication.handshake._SafeStr_42

package com.sulake.core.communication.handshake
{
    public /*dynamic*/ interface _SafeStr_42 
    {

        function init(_arg_1:String, _arg_2:uint=16):Boolean;
        function generateSharedKey(_arg_1:String, _arg_2:uint=16):String;
        function getSharedKey(_arg_1:uint=16):String;
        function getPublicKey(_arg_1:uint=16):String;
        function isValidServerPublicKey():Boolean;
        function isValidSharedKey():Boolean;

    }
}//package com.sulake.core.communication.handshake

// _SafeStr_42 = "_-mU" (String#9831, DoABC#3)


