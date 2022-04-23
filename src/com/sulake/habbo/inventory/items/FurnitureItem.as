// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.items.FurnitureItem

package com.sulake.habbo.inventory.items
{
    import com.sulake.habbo.room.IStuffData;
    import _-Go._SafeStr_1594;
    import flash.utils.getTimer;

    public class FurnitureItem implements _SafeStr_3154 
    {

        private var _SafeStr_5713:int;
        private var _SafeStr_5717:Boolean;
        private var _SafeStr_4222:int;
        private var _SafeStr_5213:Boolean;
        private var _SafeStr_3820:int;
        private var _SafeStr_5707:int;
        private var _SafeStr_4158:int;
        private var _SafeStr_4028:int;
        private var _SafeStr_4601:IStuffData;
        private var _SafeStr_4268:Number;
        private var _SafeStr_5708:Boolean;
        private var _SafeStr_5709:Boolean;
        private var _SafeStr_5710:Boolean;
        private var _SafeStr_5711:Boolean;
        private var _secondsToExpiration:int;
        private var _SafeStr_5712:Boolean;
        private var _SafeStr_5714:int;
        private var _creationMonth:int;
        private var _SafeStr_5715:int;
        private var _SafeStr_5716:String;
        private var _SafeStr_5706:Boolean;
        private var _flatId:int;

        public function FurnitureItem(_arg_1:_SafeStr_1594)
        {
            _SafeStr_3820 = _arg_1.itemId;
            _SafeStr_4028 = _arg_1.itemTypeId;
            _SafeStr_5707 = _arg_1.roomItemId;
            _SafeStr_4158 = _arg_1.category;
            _SafeStr_5710 = ((_arg_1.isGroupable) && (!(_arg_1.isRented)));
            _SafeStr_5709 = _arg_1.isTradeable;
            _SafeStr_5708 = _arg_1.isRecyclable;
            _SafeStr_5711 = _arg_1.isSellable;
            _SafeStr_4601 = _arg_1.stuffData;
            _SafeStr_4268 = _arg_1.extra;
            _secondsToExpiration = _arg_1.secondsToExpiration;
            _SafeStr_5713 = _arg_1.expirationTimeStamp;
            _SafeStr_5712 = _arg_1.hasRentPeriodStarted;
            _SafeStr_5714 = _arg_1.creationDay;
            _creationMonth = _arg_1.creationMonth;
            _SafeStr_5715 = _arg_1.creationYear;
            _SafeStr_5716 = _arg_1.slotId;
            _SafeStr_4222 = _arg_1.songId;
            _flatId = _arg_1.flatId;
            _SafeStr_5706 = _arg_1.isRented;
            _SafeStr_5717 = _arg_1.isWallItem;
        }

        public function get isRented():Boolean
        {
            return (_SafeStr_5706);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get ref():int
        {
            return (_SafeStr_5707);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function set stuffData(_arg_1:IStuffData):void
        {
            _SafeStr_4601 = _arg_1;
        }

        public function get extra():Number
        {
            return (_SafeStr_4268);
        }

        public function get recyclable():Boolean
        {
            return (_SafeStr_5708);
        }

        public function get tradeable():Boolean
        {
            return (_SafeStr_5709);
        }

        public function get groupable():Boolean
        {
            return (_SafeStr_5710);
        }

        public function get sellable():Boolean
        {
            return (_SafeStr_5711);
        }

        public function get secondsToExpiration():int
        {
            if (_secondsToExpiration == -1)
            {
                return (-1);
            };
            var _local_1:int = -1;
            if (_SafeStr_5712)
            {
                _local_1 = int((_secondsToExpiration - ((getTimer() - _SafeStr_5713) / 1000)));
                if (_local_1 < 0)
                {
                    _local_1 = 0;
                };
            }
            else
            {
                _local_1 = _secondsToExpiration;
            };
            return (_local_1);
        }

        public function get creationDay():int
        {
            return (_SafeStr_5714);
        }

        public function get creationMonth():int
        {
            return (_creationMonth);
        }

        public function get creationYear():int
        {
            return (_SafeStr_5715);
        }

        public function get slotId():String
        {
            return (_SafeStr_5716);
        }

        public function get songId():int
        {
            return (_SafeStr_4222);
        }

        public function get locked():Boolean
        {
            return (_SafeStr_5213);
        }

        public function set locked(_arg_1:Boolean):void
        {
            _SafeStr_5213 = _arg_1;
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get isWallItem():Boolean
        {
            return (_SafeStr_5717);
        }

        public function get hasRentPeriodStarted():Boolean
        {
            return (_SafeStr_5712);
        }

        public function get expirationTimeStamp():int
        {
            return (_SafeStr_5713);
        }

        public function update(_arg_1:_SafeStr_1594):void
        {
            _SafeStr_4028 = _arg_1.itemTypeId;
            _SafeStr_5707 = _arg_1.roomItemId;
            _SafeStr_4158 = _arg_1.category;
            _SafeStr_5710 = ((_arg_1.isGroupable) && (!(_arg_1.isRented)));
            _SafeStr_5709 = _arg_1.isTradeable;
            _SafeStr_5708 = _arg_1.isRecyclable;
            _SafeStr_5711 = _arg_1.isSellable;
            _SafeStr_4601 = _arg_1.stuffData;
            _SafeStr_4268 = _arg_1.extra;
            _secondsToExpiration = _arg_1.secondsToExpiration;
            _SafeStr_5713 = _arg_1.expirationTimeStamp;
            _SafeStr_5712 = _arg_1.hasRentPeriodStarted;
            _SafeStr_5714 = _arg_1.creationDay;
            _creationMonth = _arg_1.creationMonth;
            _SafeStr_5715 = _arg_1.creationYear;
            _SafeStr_5716 = _arg_1.slotId;
            _SafeStr_4222 = _arg_1.songId;
            _flatId = _arg_1.flatId;
            _SafeStr_5706 = _arg_1.isRented;
            _SafeStr_5717 = _arg_1.isWallItem;
        }


    }
}//package com.sulake.habbo.inventory.items

// _SafeStr_1594 = "_-010" (String#29234, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_4268 = "_-8L" (String#3669, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_5213 = "_-h18" (String#9789, DoABC#4)
// _SafeStr_5706 = "_-iY" (String#12910, DoABC#4)
// _SafeStr_5707 = "_-og" (String#12793, DoABC#4)
// _SafeStr_5708 = "_-cs" (String#13273, DoABC#4)
// _SafeStr_5709 = "_-t4" (String#12675, DoABC#4)
// _SafeStr_5710 = "_-E8" (String#13306, DoABC#4)
// _SafeStr_5711 = "_-iG" (String#12882, DoABC#4)
// _SafeStr_5712 = "_-JN" (String#11456, DoABC#4)
// _SafeStr_5713 = "_-ao" (String#10992, DoABC#4)
// _SafeStr_5714 = "_-M1g" (String#13485, DoABC#4)
// _SafeStr_5715 = "_-o1e" (String#12610, DoABC#4)
// _SafeStr_5716 = "_-k1L" (String#6626, DoABC#4)
// _SafeStr_5717 = "_-cq" (String#7083, DoABC#4)


