// by nota

//com.sulake.habbo.window._SafeStr_1695

package com.sulake.habbo.window
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window._SafeStr_1694;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3160;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.habbo.window.utils._SafeStr_3126;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets._SafeStr_21;
    import flash.text.StyleSheet;

    public /*dynamic*/ interface _SafeStr_1695 extends IUnknown, _SafeStr_1694 
    {

        function createWindow(_arg_1:String, _arg_2:String="", _arg_3:uint=0, _arg_4:uint=0, _arg_5:uint=0, _arg_6:Rectangle=null, _arg_7:Function=null, _arg_8:uint=0, _arg_9:uint=1, _arg_10:String=""):_SafeStr_3109;
        function removeWindow(_arg_1:String, _arg_2:uint=1):void;
        function getWindowByName(_arg_1:String, _arg_2:uint=1):_SafeStr_3109;
        function getActiveWindow(_arg_1:uint=1):_SafeStr_3109;
        function toggleFullScreen():void;
        function getWindowContext(_arg_1:uint):_SafeStr_3160;
        function alert(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3114;
        function alertWithModal(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3114;
        function alertWithLink(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function):_SafeStr_3126;
        function confirm(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3198;
        function confirmWithModal(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_SafeStr_3198;
        function registerLocalizationParameter(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):void;
        function addMouseEventTracker(_arg_1:IInputEventTracker):void;
        function removeMouseEventTracker(_arg_1:IInputEventTracker):void;
        function createUnseenItemCounter():_SafeStr_3133;
        function get resourceManager():IResourceManager;
        function buildModalDialogFromXML(_arg_1:XML):IModalDialog;
        function simpleAlert(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:_SafeStr_24=null, _arg_7:String=null, _arg_8:Function=null, _arg_9:Function=null):void;
        function get assets():_SafeStr_21;
        function registerHintWindow(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:int=1):void;
        function unregisterHintWindow(_arg_1:String):void;
        function showHint(_arg_1:String, _arg_2:Rectangle=null):void;
        function hideHint():void;
        function displayFloorPlanEditor():void;
        function openHelpPage(_arg_1:String):void;
        function get habboPagesStyleSheet():StyleSheet;
        function hideMatchingHint(_arg_1:String):void;

    }
}//package com.sulake.habbo.window

// _SafeStr_1694 = "_-41e" (String#5816, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3126 = "_-c1" (String#11584, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)


