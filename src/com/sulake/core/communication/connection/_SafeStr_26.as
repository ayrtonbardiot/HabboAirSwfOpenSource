// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.communication.connection._SafeStr_26

package com.sulake.core.communication.connection
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public /*dynamic*/ interface _SafeStr_26 
    {

        function connectionInit(_arg_1:String, _arg_2:int):void;
        function messageReceived(_arg_1:String):void;
        function messageSent(_arg_1:String):void;
        function messageParseError(_arg_1:IMessageDataWrapper):void;

    }
}//package com.sulake.core.communication.connection

// _SafeStr_26 = "_-91n" (String#7173, DoABC#3)


