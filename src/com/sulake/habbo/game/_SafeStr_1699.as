// by nota

//com.sulake.habbo.game._SafeStr_1699

package com.sulake.habbo.game
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;

    public /*dynamic*/ interface _SafeStr_1699 extends IUnknown 
    {

        function initGameDirectoryConnection():void;
        function startSnowWarGame(_arg_1:String):void;
        function startQuickSnowWarGame():void;
        function onSnowWarArenaSessionEnded():void;
        function get events():IEventDispatcher;
        function handleClickOnTile(_arg_1:RoomObjectTileMouseEvent):void;
        function handleClickOnHuman(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean):void;
        function generateChecksumMismatch():void;
        function handleMouseOverOnHuman(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean):void;
        function get gameCenterEnabled():Boolean;
        function get isHotelClosed():Boolean;

    }
}//package com.sulake.habbo.game

// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)


