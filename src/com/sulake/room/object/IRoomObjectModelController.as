// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.IRoomObjectModelController

package com.sulake.room.object
{
    import com.sulake.core.utils._SafeStr_24;

    public /*dynamic*/ interface IRoomObjectModelController extends IRoomObjectModel 
    {

        function setNumber(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void;
        function setString(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void;
        function setNumberArray(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false):void;
        function setStringArray(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false):void;
        function setStringToStringMap(_arg_1:String, _arg_2:_SafeStr_24, _arg_3:Boolean=false):void;

    }
}//package com.sulake.room.object

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)


