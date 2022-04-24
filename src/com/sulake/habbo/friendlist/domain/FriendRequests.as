// by nota

//com.sulake.habbo.friendlist.domain.FriendRequests

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.Util;

    public class FriendRequests 
    {

        private var _SafeStr_4654:_SafeStr_3147;
        private var _SafeStr_4369:Array = [];
        private var _SafeStr_4655:int;
        private var _SafeStr_4656:int;

        public function FriendRequests(_arg_1:_SafeStr_3147, _arg_2:int, _arg_3:int)
        {
            _SafeStr_4654 = _arg_1;
            _SafeStr_4655 = _arg_2;
            _SafeStr_4656 = _arg_3;
        }

        public function clearAndUpdateView(_arg_1:Boolean):void
        {
            var _local_3:Array = [];
            for each (var _local_2:FriendRequest in _SafeStr_4369)
            {
                if (((!(_arg_1)) || (!(_local_2.state == 1))))
                {
                    _local_3.push(_local_2);
                };
            };
            for each (var _local_4:FriendRequest in _local_3)
            {
                Util.remove(_SafeStr_4369, _local_4);
                if (_SafeStr_4654.view != null)
                {
                    _SafeStr_4654.view.removeRequest(_local_4);
                };
                _local_4.dispose();
            };
            refreshShading();
        }

        public function acceptFailed(_arg_1:int):void
        {
            var _local_2:FriendRequest = getRequestByRequesterId(_arg_1);
            if (_local_2 == null)
            {
                _SafeStr_14.log((("Failed to accept friend request from " + _arg_1) + ", error retrieving the friendrequest."));
                return;
            };
            _local_2.state = 4;
            _SafeStr_4654.view.refreshRequestEntry(_local_2);
        }

        public function addRequest(_arg_1:FriendRequest):void
        {
            _SafeStr_4369.push(_arg_1);
        }

        public function addRequestAndUpdateView(_arg_1:FriendRequest):void
        {
            _SafeStr_4369.push(_arg_1);
            _SafeStr_4654.view.addRequest(_arg_1);
        }

        public function getRequest(_arg_1:int):FriendRequest
        {
            for each (var _local_2:FriendRequest in _SafeStr_4369)
            {
                if (_local_2.requestId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getRequestByRequesterId(_arg_1:int):FriendRequest
        {
            for each (var _local_2:FriendRequest in _SafeStr_4369)
            {
                if (_local_2.requesterUserId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function refreshShading():void
        {
            var _local_1:Boolean = true;
            for each (var _local_2:FriendRequest in _SafeStr_4369)
            {
                _local_1 = (!(_local_1));
                _SafeStr_4654.view.refreshShading(_local_2, _local_1);
            };
        }

        public function getCountOfOpenRequests():int
        {
            var _local_1:int;
            for each (var _local_2:FriendRequest in requests)
            {
                if (_local_2.state == 1)
                {
                    _local_1++;
                };
            };
            return (_local_1);
        }

        public function get requests():Array
        {
            return (_SafeStr_4369);
        }

        public function get limit():int
        {
            return (_SafeStr_4655);
        }

        public function get clubLimit():int
        {
            return (_SafeStr_4656);
        }

        public function set limit(_arg_1:int):void
        {
            _SafeStr_4655 = _arg_1;
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3147 = "_-U1d" (String#13284, DoABC#4)
// _SafeStr_4369 = "_-cz" (String#2498, DoABC#4)
// _SafeStr_4654 = "_-U1P" (String#3068, DoABC#4)
// _SafeStr_4655 = "_-L1W" (String#5527, DoABC#4)
// _SafeStr_4656 = "_-Hb" (String#18860, DoABC#4)


