// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.leaderboard.TotalGroupLeaderboardTable

package com.sulake.habbo.game.snowwar.leaderboard
{
    import _-d1Q._SafeStr_1623;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import _-H16.Game2GetTotalGroupLeaderboardComposer;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class TotalGroupLeaderboardTable extends LeaderboardTable 
    {

        private var _ownEntry:_SafeStr_1623;

        public function TotalGroupLeaderboardTable(_arg_1:SnowWarEngine)
        {
            super(_arg_1);
            _SafeStr_6621 = (_SafeStr_6621 - 1);
        }

        override public function dispose():void
        {
            super.dispose();
            _ownEntry = null;
        }

        override public function addGroupEntries(_arg_1:Array, _arg_2:int, _arg_3:int):void
        {
            if (_arg_3 > 0)
            {
                _ownEntry = _arg_1.pop();
            };
            super.addGroupEntries(_arg_1, _arg_2, _arg_3);
        }

        override public function getVisibleEntries():Array
        {
            var _local_1:Array = super.getVisibleEntries();
            if (_ownEntry)
            {
                _local_1.push(_ownEntry);
            };
            return (_local_1);
        }

        override protected function getMessageComposer(_arg_1:int, _arg_2:int, _arg_3:int):IMessageComposer
        {
            return (new Game2GetTotalGroupLeaderboardComposer(_arg_1, _arg_2, _arg_3, _SafeStr_6621, _SafeStr_6622));
        }


    }
}//package com.sulake.habbo.game.snowwar.leaderboard

// _SafeStr_1623 = "_-g1X" (String#12244, DoABC#4)
// _SafeStr_6621 = "_-a1b" (String#3454, DoABC#4)
// _SafeStr_6622 = "_-k1z" (String#6229, DoABC#4)


