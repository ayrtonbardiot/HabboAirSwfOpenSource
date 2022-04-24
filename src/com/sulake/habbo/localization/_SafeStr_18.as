// by nota

//com.sulake.habbo.localization._SafeStr_18

package com.sulake.habbo.localization
{
    import com.sulake.core.localization._SafeStr_17;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils._SafeStr_24;

    public /*dynamic*/ interface _SafeStr_18 extends _SafeStr_17, IUnknown 
    {

        function loadDefaultEmbedLocalizations(_arg_1:String, _arg_2:Boolean=false):Boolean;
        function requestLocalizationInit():void;
        function getActiveEnvironmentId():String;
        function getExternalVariablesUrl():String;
        function getExternalVariablesHash():String;
        function getLocalizationWithParams(_arg_1:String, _arg_2:String="", ... _args):String;
        function getLocalizationWithParamMap(_arg_1:String, _arg_2:String="", _arg_3:_SafeStr_24=null):String;
        function getAchievementName(_arg_1:String):String;
        function getAchievementDesc(_arg_1:String, _arg_2:int):String;
        function getAchievementInstruction(_arg_1:String):String;
        function getBadgeBaseName(_arg_1:String):String;
        function getBadgeName(_arg_1:String):String;
        function getBadgeDesc(_arg_1:String):String;
        function setBadgePointLimit(_arg_1:String, _arg_2:int):void;
        function getPreviousLevelBadgeId(_arg_1:String):String;

    }
}//package com.sulake.habbo.localization

// _SafeStr_17 = "_-94" (String#7182, DoABC#3)
// _SafeStr_18 = "_-61x" (String#6977, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)


