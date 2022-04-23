// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.communication.encryption.IEncryption

package com.sulake.core.communication.encryption
{
    import flash.utils.ByteArray;

    public /*dynamic*/ interface IEncryption 
    {

        function init(_arg_1:ByteArray):void;
        function encipher(_arg_1:ByteArray):void;
        function decipher(_arg_1:ByteArray):void;
        function mark():void;
        function reset():void;

    }
}//package com.sulake.core.communication.encryption

