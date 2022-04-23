// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar._SafeStr_1758

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface _SafeStr_1758 extends IUnknown 
    {

        function openEditor(_arg_1:uint, _arg_2:_SafeStr_3223, _arg_3:Array=null, _arg_4:Boolean=false, _arg_5:String=null, _arg_6:String="generic"):_SafeStr_3263;
        function embedEditorToContext(_arg_1:uint, _arg_2:_SafeStr_3133, _arg_3:_SafeStr_3223=null, _arg_4:Array=null, _arg_5:Boolean=false, _arg_6:Boolean=false):Boolean;
        function loadAvatarInEditor(_arg_1:uint, _arg_2:String, _arg_3:String, _arg_4:int=0):void;
        function loadOwnAvatarInEditor(_arg_1:uint):void;
        function get events():IEventDispatcher;
        function close(_arg_1:uint):void;

    }
}//package com.sulake.habbo.avatar

// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3223 = "_-Z1v" (String#6974, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)


