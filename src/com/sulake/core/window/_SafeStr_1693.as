// by nota

//com.sulake.core.window._SafeStr_1693

package com.sulake.core.window
{
    import flash.geom.Rectangle;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.theme.IThemeManager;

    public /*dynamic*/ interface _SafeStr_1693 
    {

        function create(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, _arg_10:_SafeStr_3109=null, _arg_11:Array=null, _arg_12:String=""):_SafeStr_3109;
        function destroy(_arg_1:_SafeStr_3109):void;
        function buildFromXML(_arg_1:XML, _arg_2:uint=1, _arg_3:_SafeStr_24=null):_SafeStr_3109;
        function windowToXMLString(_arg_1:_SafeStr_3109):String;
        function getLayoutByTypeAndStyle(_arg_1:uint, _arg_2:uint):XML;
        function getDefaultsByTypeAndStyle(_arg_1:uint, _arg_2:uint):DefaultAttStruct;
        function getThemeManager():IThemeManager;

    }
}//package com.sulake.core.window

// _SafeStr_1693 = "_-mi" (String#10645, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


