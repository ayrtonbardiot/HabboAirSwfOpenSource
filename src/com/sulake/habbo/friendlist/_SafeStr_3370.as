// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist._SafeStr_3370

package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendlist.domain.FriendRequest;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.utils.ExtendedProfileIcon;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-Po._SafeStr_892;
    import com.sulake.habbo.friendlist.events.FriendRequestEvent;
    import _-Po._SafeStr_167;
    import _-XO._SafeStr_313;

    public class _SafeStr_3370 implements ITabView, _SafeStr_3112 
    {

        private static const NO_REQS_INFO:String = "no_reqs_info";

        private var _friendList:HabboFriendList;
        private var _SafeStr_4162:IItemListWindow;
        private var _acceptAllButton:_SafeStr_3240;
        private var _declineAllButton:_SafeStr_3240;


        public function init(_arg_1:HabboFriendList):void
        {
            _friendList = _arg_1;
        }

        public function getEntryCount():int
        {
            return (_friendList.friendRequests.getCountOfOpenRequests());
        }

        public function fillFooter(_arg_1:_SafeStr_3133):void
        {
            _acceptAllButton = _SafeStr_3240(_arg_1.findChildByName("accept_all_but"));
            _declineAllButton = _SafeStr_3240(_arg_1.findChildByName("reject_all_but"));
            _declineAllButton.procedure = onDismissAllButtonClick;
            _acceptAllButton.procedure = onAcceptAllButtonClick;
            refreshButtons();
        }

        public function fillList(_arg_1:IItemListWindow):void
        {
            _SafeStr_4162 = _arg_1;
            for each (var _local_2:FriendRequest in _friendList.friendRequests.requests)
            {
                getRequestEntry(_local_2);
                refreshRequestEntry(_local_2);
                _arg_1.addListItem(_local_2.view);
            };
            _friendList.friendRequests.refreshShading();
        }

        public function tabClicked(_arg_1:int):void
        {
            if (_SafeStr_4162 == null)
            {
                return;
            };
            _friendList.friendRequests.clearAndUpdateView(true);
        }

        public function refreshShading(_arg_1:FriendRequest, _arg_2:Boolean):void
        {
            if (_SafeStr_4162 == null)
            {
                return;
            };
            _arg_1.view.color = _friendList.laf.getRowShadingColor(2, _arg_2);
            setButtonBg(_arg_1.view, "reject");
            setButtonBg(_arg_1.view, "accept");
        }

        public function refreshRequestEntry(_arg_1:FriendRequest):void
        {
            if (_SafeStr_4162 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3133 = _arg_1.view;
            Util.hideChildren(_local_3);
            var _local_2:_SafeStr_3109 = _local_3.findChildByName("bg_region");
            _local_2.visible = true;
            _local_2.procedure = onEntry;
            _local_2.id = _arg_1.requesterUserId;
            _local_3.findChildByName("user_info_region").visible = true;
            ExtendedProfileIcon.setUserInfoState(false, _local_3);
            _friendList.refreshText(_local_3, "requester_name_text", true, _arg_1.requesterName);
            if (_arg_1.state == 1)
            {
                _friendList.refreshIcon(_local_3, "accept", true, onAcceptButtonClick, _arg_1.requestId);
                _friendList.refreshIcon(_local_3, "reject", true, onDeclineButtonClick, _arg_1.requestId);
            }
            else
            {
                if (_arg_1.state == 2)
                {
                    _friendList.refreshText(_local_3, "info_text", true, "${friendlist.request.accepted}");
                }
                else
                {
                    if (_arg_1.state == 3)
                    {
                        _friendList.refreshText(_local_3, "info_text", true, "${friendlist.request.declined}");
                    }
                    else
                    {
                        if (_arg_1.state == 4)
                        {
                            _friendList.refreshText(_local_3, "info_text", true, "${friendlist.request.failed}");
                        };
                    };
                };
            };
        }

        private function setButtonBg(_arg_1:_SafeStr_3133, _arg_2:String):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            if (_local_3 != null)
            {
                _local_3.color = _arg_1.color;
            };
        }

        public function addRequest(_arg_1:FriendRequest):void
        {
            if (_SafeStr_4162 == null)
            {
                return;
            };
            getRequestEntry(_arg_1);
            refreshRequestEntry(_arg_1);
            _SafeStr_4162.addListItem(_arg_1.view);
            _friendList.friendRequests.refreshShading();
            refreshButtons();
        }

        public function removeRequest(_arg_1:FriendRequest):void
        {
            if (_SafeStr_4162 == null)
            {
                return;
            };
            _SafeStr_4162.removeListItem(_arg_1.view);
            refreshButtons();
        }

        private function getRequestEntry(_arg_1:FriendRequest):void
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_friendList.getXmlWindow("friend_request_entry"));
            _arg_1.view = _local_2;
        }

        private function onAcceptButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.accept}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_3:int = _arg_2.id;
            _SafeStr_14.log(("accept clicked: " + _local_3));
            acceptRequest(_local_3);
        }

        public function acceptRequest(_arg_1:int):void
        {
            var _local_3:FriendRequest = _friendList.friendRequests.getRequest(_arg_1);
            if (!_local_3)
            {
                return;
            };
            _local_3.state = 2;
            if (_friendList.categories.getFriendCount(false) >= _friendList.friendRequests.limit)
            {
                _friendList.showLimitReachedAlert();
                return;
            };
            var _local_2:_SafeStr_892 = new _SafeStr_892();
            _local_2.addAcceptedRequest(_local_3.requestId);
            _friendList.send(_local_2);
            refreshRequestEntry(_local_3);
            refresh();
            if (((_friendList) && (_friendList.events)))
            {
                _friendList.events.dispatchEvent(new FriendRequestEvent("FRE_ACCEPTED", _arg_1));
            };
        }

        public function acceptAllRequests():void
        {
            if ((_friendList.categories.getFriendCount(false) + _friendList.friendRequests.requests.length) > _friendList.friendRequests.limit)
            {
                _friendList.showLimitReachedAlert();
                return;
            };
            var _local_1:_SafeStr_892 = new _SafeStr_892();
            for each (var _local_2:FriendRequest in _friendList.friendRequests.requests)
            {
                if (((!(_local_2.state == 2)) && (!(_local_2.state == 3))))
                {
                    _local_1.addAcceptedRequest(_local_2.requestId);
                    _local_2.state = 2;
                    refreshRequestEntry(_local_2);
                    if (((_friendList) && (_friendList.events)))
                    {
                        _friendList.events.dispatchEvent(new FriendRequestEvent("FRE_ACCEPTED", _local_2.requestId));
                    };
                };
            };
            _friendList.send(_local_1);
            refresh();
        }

        private function onDeclineButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.decline}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_3:int = _arg_2.id;
            _SafeStr_14.log(("decline clicked: " + _local_3));
            declineRequest(_local_3);
        }

        public function declineRequest(_arg_1:int):void
        {
            var _local_3:FriendRequest = _friendList.friendRequests.getRequest(_arg_1);
            if (!_local_3)
            {
                return;
            };
            _local_3.state = 3;
            var _local_2:_SafeStr_167 = new _SafeStr_167();
            _local_2.addDeclinedRequest(_arg_1);
            _friendList.send(_local_2);
            refreshRequestEntry(_local_3);
            refresh();
            if (((_friendList) && (_friendList.events)))
            {
                _friendList.events.dispatchEvent(new FriendRequestEvent("FRE_DECLINED", _arg_1));
            };
        }

        public function declineAllRequests():void
        {
            var _local_1:_SafeStr_167 = new _SafeStr_167();
            _friendList.send(_local_1);
            for each (var _local_2:FriendRequest in _friendList.friendRequests.requests)
            {
                if (((!(_local_2.state == 2)) && (!(_local_2.state == 3))))
                {
                    _local_2.state = 3;
                    refreshRequestEntry(_local_2);
                    if (((_friendList) && (_friendList.events)))
                    {
                        _friendList.events.dispatchEvent(new FriendRequestEvent("FRE_DECLINED", _local_2.requestId));
                    };
                };
            };
            refresh();
        }

        private function onEntry(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${infostand.profile.link.tooltip}");
            ExtendedProfileIcon.onEntry(_arg_1, _arg_2);
            if (_arg_1.type == "WME_CLICK")
            {
                _friendList.trackGoogle("extendedProfile", "friendList_friendRequests");
                _friendList.send(new _SafeStr_313(_arg_2.id));
            };
        }

        private function onDismissAllButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.declineall}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Dismiss all clicked");
            declineAllRequests();
        }

        private function onAcceptAllButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _friendList.view.showInfo(_arg_1, "${friendlist.tip.acceptall}");
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Accept all clicked");
            acceptAllRequests();
        }

        private function refresh():void
        {
            refreshButtons();
        }

        private function refreshButtons():void
        {
            var _local_1:* = (_friendList.friendRequests.getCountOfOpenRequests() > 0);
            setEnabled(_acceptAllButton, _local_1);
            setEnabled(_declineAllButton, _local_1);
        }

        private function setEnabled(_arg_1:_SafeStr_3240, _arg_2:Boolean):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_2)
            {
                _arg_1.enable();
            }
            else
            {
                _arg_1.disable();
            };
        }


    }
}//package com.sulake.habbo.friendlist

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_167 = "_-Uq" (String#12788, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3112 = "_-S1u" (String#5103, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3370 = "_-91g" (String#15021, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_892 = "_-T1e" (String#11961, DoABC#4)


