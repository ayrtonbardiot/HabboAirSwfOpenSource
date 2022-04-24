// by nota

//com.sulake.habbo.catalog.marketplace.IMarketPlace

package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils._SafeStr_24;

    public /*dynamic*/ interface IMarketPlace 
    {

        function get windowManager():_SafeStr_1695;
        function get localization():_SafeStr_18;
        function registerVisualization(_arg_1:IMarketPlaceVisualization=null):void;
        function onOffers(_arg_1:IMessageEvent):void;
        function onOwnOffers(_arg_1:IMessageEvent):void;
        function onBuyResult(_arg_1:IMessageEvent):void;
        function onCancelResult(_arg_1:IMessageEvent):void;
        function requestOffersByName(_arg_1:String):void;
        function requestOffersByPrice(_arg_1:int):void;
        function requestOffers(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function refreshOffers():void;
        function requestOwnItems():void;
        function requestItemStats(_arg_1:int, _arg_2:int):void;
        function buyOffer(_arg_1:int):void;
        function redeemExpiredOffer(_arg_1:int):void;
        function latestOffers():_SafeStr_24;
        function latestOwnOffers():_SafeStr_24;
        function totalItemsFound():int;
        function set itemStats(_arg_1:_SafeStr_3209):void;
        function get itemStats():_SafeStr_3209;
        function get creditsWaiting():int;
        function get averagePricePeriod():int;
        function set averagePricePeriod(_arg_1:int):void;
        function getNameLocalizationKey(_arg_1:IMarketPlaceOfferData):String;
        function getDescriptionLocalizationKey(_arg_1:IMarketPlaceOfferData):String;
        function isAccountSafetyLocked():Boolean;

    }
}//package com.sulake.habbo.catalog.marketplace

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3209 = "_-02T" (String#6368, DoABC#4)


