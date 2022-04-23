// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.localization._SafeStr_17

package com.sulake.core.localization
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils._SafeStr_24;

    public /*dynamic*/ interface _SafeStr_17 extends IUnknown 
    {

        function registerListener(_arg_1:String, _arg_2:ILocalizable):Boolean;
        function removeListener(_arg_1:String, _arg_2:ILocalizable):Boolean;
        function loadLocalizationFromURL(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void;
        function hasLocalization(_arg_1:String):Boolean;
        function getLocalization(_arg_1:String, _arg_2:String=""):String;
        function updateLocalization(_arg_1:String, _arg_2:String):void;
        function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):String;
        function getLocalizationRaw(_arg_1:String):ILocalization;
        function getKeys():Array;
        function registerLocalizationDefinition(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String):void;
        function activateLocalizationDefinition(_arg_1:String):Boolean;
        function getLocalizationDefinitions():_SafeStr_24;
        function getLocalizationDefinition(_arg_1:String):ILocalizationDefinition;
        function getActiveLocalizationDefinition():ILocalizationDefinition;
        function printNonExistingKeys():void;
        function getGameDataResources():_SafeStr_40;

    }
}//package com.sulake.core.localization

// _SafeStr_17 = "_-94" (String#7182, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_40 = "_-dT" (String#9239, DoABC#3)


