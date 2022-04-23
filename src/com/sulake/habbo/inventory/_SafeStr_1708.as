// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory._SafeStr_1708

package com.sulake.habbo.inventory
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.inventory.items._SafeStr_3154;

    public /*dynamic*/ interface _SafeStr_1708 extends IUnknown 
    {

        function get events():IEventDispatcher;
        function get clubDays():int;
        function get clubPeriods():int;
        function get clubPastPeriods():int;
        function get clubLevel():int;
        function get clubHasEverBeenMember():Boolean;
        function get clubIsExpiring():Boolean;
        function get citizenshipVipIsExpiring():Boolean;
        function get clubMinutesUntilExpiration():int;
        function get tradingActive():Boolean;
        function get hasRoomSession():Boolean;
        function get unseenItemTracker():_SafeStr_3184;
        function getAllMyBadgeIds(_arg_1:Array):Array;
        function getActivatedAvatarEffects():Array;
        function getAvatarEffects():Array;
        function requestSelectedFurniToMover(_arg_1:_SafeStr_3154):Boolean;
        function getFloorItemById(_arg_1:int):_SafeStr_3154;
        function getWallItemById(_arg_1:int):_SafeStr_3154;
        function placePetToRoom(_arg_1:int, _arg_2:Boolean=false):Boolean;
        function setEffectSelected(_arg_1:int):void;
        function getLastActivatedEffect():int;
        function setEffectDeselected(_arg_1:int):void;
        function deselectAllEffects(_arg_1:Boolean=false):void;
        function getAvatarEffect(_arg_1:int):_SafeStr_3123;
        function setupTrading(_arg_1:int, _arg_2:String):void;
        function toggleInventoryPage(_arg_1:String, _arg_2:String=null, _arg_3:Boolean=false):void;
        function toggleInventorySubPage(_arg_1:String):void;
        function removeUnseenFurniCounter(_arg_1:int):Boolean;
        function removeUnseenPetCounter(_arg_1:int):Boolean;
        function hasFigureSetIdInInventory(_arg_1:int):Boolean;
        function hasBoundFigureSetFurniture(_arg_1:String):Boolean;
        function checkCategoryInitilization(_arg_1:String):Boolean;
        function getNonRentedInventoryIds(_arg_1:String, _arg_2:int):Array;

    }
}//package com.sulake.habbo.inventory

// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_3123 = "_-k1o" (String#7780, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3184 = "_-V1C" (String#10342, DoABC#4)


