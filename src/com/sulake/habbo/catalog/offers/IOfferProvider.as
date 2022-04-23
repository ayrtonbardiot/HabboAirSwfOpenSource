// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.offers.IOfferProvider

package com.sulake.habbo.catalog.offers
{
    import com.sulake.core.runtime._SafeStr_13;

    public /*dynamic*/ interface IOfferProvider extends _SafeStr_13 
    {

        function get enabled():Boolean;
        function load():void;
        function showVideo():void;
        function get videoAvailable():Boolean;
        function get showingPopup():Boolean;

    }
}//package com.sulake.habbo.catalog.offers

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)


