// by nota

//com.sulake.habbo.navigator._SafeStr_3205

package com.sulake.habbo.navigator
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import _-21f._SafeStr_150;
    import _-g1x._SafeStr_285;
    import _-21f._SafeStr_716;
    import _-Ja._SafeStr_444;
    import _-n1H._SafeStr_997;
    import _-n1H._SafeStr_678;
    import _-21f._SafeStr_894;
    import _-Ja._SafeStr_463;
    import _-n1H._SafeStr_513;
    import _-Ja._SafeStr_717;
    import _-Ja._SafeStr_703;
    import _-Ja._SafeStr_432;
    import _-Nk._SafeStr_551;
    import _-y1x._SafeStr_605;
    import _-Ja._SafeStr_707;
    import _-n1H._SafeStr_1013;
    import _-21f._SafeStr_673;
    import _-21f._SafeStr_338;
    import _-Ja._SafeStr_499;
    import _-21f._SafeStr_353;
    import _-n1H._SafeStr_977;
    import _-Ja._SafeStr_748;
    import _-Ja._SafeStr_787;
    import _-W1K._SafeStr_785;
    import _-n1H._SafeStr_724;
    import _-n1H._SafeStr_789;
    import _-Ja._SafeStr_876;
    import _-Ja._SafeStr_128;
    import _-n1H._SafeStr_311;
    import _-JS._SafeStr_404;
    import _-y1x._SafeStr_823;
    import _-Ja._SafeStr_972;
    import _-n1H._SafeStr_865;
    import _-Ja._SafeStr_288;
    import _-Ja._SafeStr_591;
    import _-Ja._SafeStr_507;
    import _-n1H._SafeStr_924;
    import _-y1x._SafeStr_346;
    import _-Ja._SafeStr_571;
    import _-JS._SafeStr_373;
    import _-Ja._SafeStr_682;
    import _-n1H._SafeStr_903;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-21f._SafeStr_3197;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import _-Z1C._SafeStr_1290;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import _-yL._SafeStr_528;
    import _-K1r._SafeStr_1185;
    import _-M1k._SafeStr_781;
    import _-M1k._SafeStr_934;
    import _-yL._SafeStr_142;
    import _-31H._SafeStr_1303;
    import _-31H._SafeStr_1284;
    import _-Ja._SafeStr_1634;
    import _-Ja._SafeStr_1621;
    import _-31H._SafeStr_1085;
    import _-31H._SafeStr_1264;
    import com.sulake.habbo.utils.HabboWebTools;
    import _-31H._SafeStr_1512;
    import com.sulake.core.utils.ErrorReportStorage;
    import _-31H._SafeStr_1293;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import _-31H._SafeStr_1059;
    import _-l1Q._SafeStr_1172;
    import _-Z1C._SafeStr_1211;
    import _-Z1C._SafeStr_1417;
    import _-Z1C._SafeStr_1128;
    import _-31H._SafeStr_1375;
    import _-M1k._SafeStr_525;
    import _-31H._SafeStr_1486;
    import _-31H._SafeStr_1354;
    import _-Z1C._SafeStr_1110;
    import _-Z1C._SafeStr_1313;
    import _-Z1C._SafeStr_1208;
    import _-Z1C._SafeStr_1339;
    import _-Z1C._SafeStr_1329;
    import _-l1n._SafeStr_1418;
    import _-31H._SafeStr_1424;
    import _-31H._SafeStr_1438;
    import com.sulake.core.window._SafeStr_3109;
    import _-l1n._SafeStr_1338;
    import _-IR._SafeStr_316;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;

    [SecureSWF(rename="true")]
    public class _SafeStr_3205 
    {

        private var _navigator:HabboNewNavigator;
        private var _messageListeners:Array = [];

        public function _SafeStr_3205(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
            var _local_2:IHabboCommunicationManager = _navigator.communication;
            addMessageListeners();
        }

        public function addMessageListeners():void
        {
            var _local_1:IHabboCommunicationManager = _navigator.communication;
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_150(onNavigatorSearchResultBlocks)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_285(onNoOwnedRoomsAlert)));
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_716(onNavigatorMetaData)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_444(onCategoriesWithUserCount)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_997(onUserUnbannedFromRoom)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_678(onFlatControllers)));
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_894(onCollapsedCategories)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_463(onRoomInfoUpdated)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_513(onRoomSettingsSaved)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_717(onFavouriteChanged)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_703(onRoomRating)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_432(onGuestRoomSearchResult)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_551(onRoomFilterSettings)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_605(onRoomExit)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_707(onRoomEventCancel)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_1013(onNoSuchFlat)));
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_673(onSavedSearches)));
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_338(onNavigatorLiftedRooms)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_499(onUserEventCats)));
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_353(onNavigatorPreferences)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_977(onFlatControllerAdded)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_748(onFlatCreated)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_787(onDoorbell)));
            _messageListeners.push(_local_1.connection.addMessageEvent(new _SafeStr_785(onGroupDetails)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_724(onRoomSettingsData)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_789(onFlatControllerRemoved)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_876(onPopularRoomTagsResult)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_128(onFavourites)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_311(onRoomSettingsError)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_404(onFriendListUpdate)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_823(onCantConnect)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_972(onFlatAccessDenied)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_865(onBannedUsersFromRoom)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_288(onOfficialRooms)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_591(onRoomEventEvent)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_507(onCompetitionData)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_924(onRoomSettingsSaveError)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_346(onDoorOpened)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_571(onUserFlatCats)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_373(onFriendsListFragment)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_682(onCanCreateRoomEventEvent)));
            _messageListeners.push(_local_1.addHabboConnectionMessageEvent(new _SafeStr_903(onMuteAllEvent)));
        }

        public function removeLegacyMessageListeners():void
        {
            var _local_1:IHabboCommunicationManager = _navigator.communication;
            for each (var _local_2:IMessageEvent in _messageListeners)
            {
                _local_1.removeHabboConnectionMessageEvent(_local_2);
            };
            _messageListeners = [];
        }

        private function onNavigatorMetaData(_arg_1:_SafeStr_716):void
        {
            _navigator.initialize(_arg_1.getParser());
        }

        private function onNavigatorSearchResultBlocks(_arg_1:_SafeStr_150):void
        {
            _navigator.onSearchResult(new _SafeStr_3197(_arg_1.getParser().searchResult));
        }

        private function onNavigatorLiftedRooms(_arg_1:_SafeStr_338):void
        {
            _navigator.onLiftedRooms(_arg_1.getParser());
        }

        private function onNavigatorPreferences(_arg_1:_SafeStr_353):void
        {
            _navigator.onPreferences(_arg_1.getParser());
        }

        private function onSavedSearches(_arg_1:_SafeStr_673):void
        {
            _navigator.onSavedSearches(_arg_1.getParser());
        }

        private function onGroupDetails(_arg_1:_SafeStr_785):void
        {
            _navigator.onGroupDetails(_arg_1.data);
        }

        private function onCollapsedCategories(_arg_1:_SafeStr_894):void
        {
            _navigator.onCollapsedCategories(_arg_1.getParser().collapsedCategories);
        }

        private function get data():NavigatorData
        {
            return (_navigator.data);
        }

        private function onMuteAllEvent(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_903 = (_arg_1 as _SafeStr_903);
            var _local_3:_SafeStr_1290 = _local_4.getParser();
            var _local_2:_SafeStr_1569 = _navigator.data.enteredGuestRoom;
            if (_local_2 != null)
            {
                _local_2.allInRoomMuted = _local_3.allMuted;
                if (LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl != null)
                {
                    LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.refreshButtons(_navigator.data.enteredGuestRoom);
                };
            };
        }

        private function onNoSuchFlat(_arg_1:IMessageEvent):void
        {
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1185 = _SafeStr_528(_arg_1).getParser();
            _navigator.data.avatarId = _local_2.id;
            LegacyNavigator(_navigator.legacyNavigator).send(new _SafeStr_781());
            LegacyNavigator(_navigator.legacyNavigator).send(new _SafeStr_934());
        }

        private function onUserRights(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if (_navigator)
            {
                _local_2 = _SafeStr_142(_arg_1);
                if (_local_2.securityLevel >= 5)
                {
                    _navigator.data.eventMod = true;
                };
                if (_local_2.securityLevel >= 7)
                {
                    _navigator.data.roomPicker = true;
                };
            };
        }

        private function onCategoriesWithUserCount(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1303 = _SafeStr_444(_arg_1).getParser();
            data.categoriesWithVisitorData = _local_2.data;
            _SafeStr_14.log(("Received Categories with user count: " + data.categoriesWithVisitorData.categoryToCurrentUserCountMap.length));
        }

        private function onOfficialRooms(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1284 = _SafeStr_288(_arg_1).getParser();
            data.officialRooms = _local_2.data;
            data.adRoom = _local_2.adRoom;
            data.promotedRooms = _local_2.promotedRooms;
            _SafeStr_14.log(("Received Official rooms: " + data.officialRooms.entries.length));
        }

        private function onGuestRoomSearchResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1634 = _SafeStr_432(_arg_1).getParser().data;
            data.guestRoomSearchResults = _local_2;
            _SafeStr_14.log(("Received GuestRoomSearch: " + ((data.guestRoomSearchResults.rooms) ? data.guestRoomSearchResults.rooms.length : " no rooms")));
        }

        private function onPopularRoomTagsResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1621 = _SafeStr_876(_arg_1).getParser().data;
            data.popularTags = _local_2;
            _SafeStr_14.log(("Received popular room tags: " + data.popularTags.tags.length));
        }

        private function onRoomEventEvent(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1085 = _SafeStr_591(_arg_1).getParser();
            _SafeStr_14.log(((("Got room event: " + _local_2.data.ownerAvatarId) + ", ") + _local_2.data.eventName));
            data.roomEventData = ((_local_2.data.ownerAvatarId > 0) ? _local_2.data : null);
            LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function onRoomEventCancel(_arg_1:IMessageEvent):void
        {
            data.roomEventData = null;
            LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function onCanCreateRoomEventEvent(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1264 = _SafeStr_682(_arg_1).getParser();
            _SafeStr_14.log(("CAN CREATE EVENT: " + _local_2.canCreateEvent));
            if (_local_2.canCreateEvent)
            {
                LegacyNavigator(_navigator.legacyNavigator).roomEventViewCtrl.show();
            }
            else
            {
                _local_3 = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${navigator.cannotcreateevent.title}", (("${navigator.cannotcreateevent.error." + _local_2.errorCode) + "}"));
                _local_3.show();
                _SafeStr_14.log("Cannot create an event just now...");
            };
        }

        private function requestRoomEnterAd():void
        {
            if (_navigator.getProperty("roomenterad.habblet.enabled") == "true")
            {
                HabboWebTools.openRoomEnterAd();
            };
        }

        private function onFlatCreated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1512 = _SafeStr_748(_arg_1).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ((("Flat created: " + _local_2.flatId) + ", ") + _local_2.flatName));
            data.createdFlatId = _local_2.flatId;
            LegacyNavigator(_navigator.legacyNavigator).goToRoom(_local_2.flatId, true);
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.reloadRoomList(5);
            LegacyNavigator(_navigator.legacyNavigator).goToMainView();
            LegacyNavigator(_navigator.legacyNavigator).closeNavigator();
        }

        private function onGameStarted(_arg_1:IMessageEvent):void
        {
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.close();
        }

        private function onRoomExit(_arg_1:IMessageEvent):void
        {
            _SafeStr_14.log("Navigator: exiting room");
            data.onRoomExit();
            LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomEventViewCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomFilterCtrl.close();
            var _local_2:Boolean = _navigator.getBoolean("news.auto_popup.enabled");
            if (_local_2)
            {
                HabboWebTools.openNews();
            };
        }

        private function onUserFlatCats(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1293 = (_arg_1 as _SafeStr_571).getParser();
            _navigator.data.categories = _local_3.nodes;
            var _local_2:RoomsTabPageDecorator = RoomsTabPageDecorator(LegacyNavigator(_navigator.legacyNavigator).tabs.getTab(2).tabPageDecorator);
            _local_2.prepareRoomCategories();
        }

        private function onUserEventCats(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1059 = (_arg_1 as _SafeStr_499).getParser();
            _navigator.data.eventCategories = _local_2.eventCategories;
        }

        private function onRoomSettingsData(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            try
            {
                _local_2 = (_arg_1 as _SafeStr_724).getParser();
                LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onRoomSettings(_local_2.data);
                _SafeStr_14.log(((((("GOT ROOM SETTINGS DATA: " + _local_2.data.name) + ", ") + _local_2.data.maximumVisitors) + ", ") + _local_2.data.maximumVisitorsLimit));
            }
            catch(e:Error)
            {
                _SafeStr_14.log("CRASHED WHILE PROCESSING ROOM SETTINGS DATA!");
            };
        }

        private function onRoomFilterSettings(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1172 = (_arg_1 as _SafeStr_551).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomFilterCtrl.onRoomFilterSettings(_local_2.badWords);
            _SafeStr_14.log(("GOT ROOM FILTER SETTINGS: " + _local_2.badWords));
        }

        private function onRoomSettingsError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1211 = (_arg_1 as _SafeStr_311).getParser();
        }

        private function onRoomSettingsSaved(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1417 = (_arg_1 as _SafeStr_513).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", ("Room settings saved: " + _local_2.roomId));
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.reloadRoomList(5);
        }

        private function onRoomSettingsSaveError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1128 = (_arg_1 as _SafeStr_924).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onRoomSettingsSaveError(_local_2.roomId, _local_2.errorCode, _local_2.info);
        }

        private function onRoomInfoUpdated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1375 = (_arg_1 as _SafeStr_463).getParser();
            LegacyNavigator(_navigator.legacyNavigator).send(new _SafeStr_525(_local_2.flatId, false, false));
        }

        private function onFavourites(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1486 = (_arg_1 as _SafeStr_128).getParser();
            _navigator.data.onFavourites(_local_2);
        }

        private function onFavouriteChanged(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1354 = (_arg_1 as _SafeStr_717).getParser();
            data.favouriteChanged(_local_2.flatId, _local_2.added);
            LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.reload();
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.refresh();
        }

        private function onFlatControllers(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1110 = (_arg_1 as _SafeStr_678).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllers(_local_2.roomId, _local_2.controllers);
        }

        private function onFlatControllerAdded(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1313 = (_arg_1 as _SafeStr_977).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllerAdded(_local_2.flatId, _local_2.data);
        }

        private function onFlatControllerRemoved(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1208 = (_arg_1 as _SafeStr_789).getParser();
            _SafeStr_14.log(((("Flat controller removed: " + _local_2.flatId) + ", ") + _local_2.userId));
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllerRemoved(_local_2.flatId, _local_2.userId);
        }

        private function onBannedUsersFromRoom(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1339 = (_arg_1 as _SafeStr_865).getParser();
            _SafeStr_14.log(((("Got Banned users for room: " + _local_2.roomId) + ", ") + _local_2.bannedUsers.length));
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onBannedUsersFromRoom(_local_2.roomId, _local_2.bannedUsers);
        }

        private function onUserUnbannedFromRoom(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1329 = (_arg_1 as _SafeStr_997).getParser();
            _SafeStr_14.log(((("User was unbanned from room. User Id: " + _local_2.userId) + " Room Id: ") + _local_2.roomId));
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onUserUnbannedFromRoom(_local_2.roomId, _local_2.userId);
        }

        private function onDoorbell(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_787 = (_arg_1 as _SafeStr_787);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.userName != "")
            {
                return;
            };
            LegacyNavigator(_navigator.legacyNavigator).doorbell.showWaiting();
        }

        private function onDoorOpened(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_346 = (_arg_1 as _SafeStr_346);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1418 = _local_3.getParser();
            if (((!(_local_2 == null)) && ((_local_2.userName == null) || (_local_2.userName.length == 0))))
            {
                LegacyNavigator(_navigator.legacyNavigator).doorbell.hide();
            };
        }

        private function onRoomRating(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1424 = (_arg_1 as _SafeStr_703).getParser();
            data.currentRoomRating = _local_2.rating;
            data.canRate = _local_2.canRate;
            LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.reload();
        }

        private function onFlatAccessDenied(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1438 = (_arg_1 as _SafeStr_972).getParser();
            if (((_local_2.userName == null) || (_local_2.userName == "")))
            {
                LegacyNavigator(_navigator.legacyNavigator).doorbell.showNoAnswer();
            };
        }

        private function onFriendsListFragment(_arg_1:IMessageEvent):void
        {
            data.friendList.onFriendsListFragment(_arg_1);
        }

        private function onFriendListUpdate(_arg_1:IMessageEvent):void
        {
            data.friendList.onFriendListUpdate(_arg_1);
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFriendListUpdate();
        }

        private function onCompetitionData(_arg_1:_SafeStr_507):void
        {
            data.competitionRoomsData = _arg_1.getParser().data;
        }

        private function forwardToRoom(_arg_1:int):void
        {
            LegacyNavigator(_navigator.legacyNavigator).send(new _SafeStr_525(_arg_1, false, true));
            LegacyNavigator(_navigator.legacyNavigator).trackNavigationDataPoint("Room Forward", "go.roomforward", "", _arg_1);
        }

        private function onNoOwnedRoomsAlert(_arg_1:_SafeStr_285):void
        {
            LegacyNavigator(_navigator.legacyNavigator).startRoomCreation();
        }

        private function closeOpenCantConnectAlerts():void
        {
            var _local_1:* = null;
            var _local_7:* = null;
            var _local_4:int;
            var _local_5:int;
            var _local_6:* = null;
            var _local_3:* = null;
            if (_navigator != null)
            {
                _local_1 = [];
                _local_7 = _navigator.windowManager.getWindowContext(2);
                _local_4 = _local_7.getDesktopWindow().numChildren;
                _local_5 = 0;
                while (_local_5 < _local_4)
                {
                    _local_6 = _local_7.getDesktopWindow().getChildAt(_local_5);
                    if (_local_6.tags.indexOf("SimpleAlertView") > -1)
                    {
                        _local_1.push(_local_6);
                    };
                    _local_5++;
                };
                if (_local_1.length > 0)
                {
                    for each (var _local_2:_SafeStr_3109 in _local_1)
                    {
                        _local_3 = AlertView.findAlertView(_local_2);
                        if (_local_3 != null)
                        {
                            _local_3.dispose();
                        };
                    };
                };
            };
        }

        private function onCantConnect(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1338 = (_arg_1 as _SafeStr_823).getParser();
            _SafeStr_14.log(("FAILED TO CONNECT: REASON: " + _local_3.reason));
            switch (_local_3.reason)
            {
                case 1:
                    _local_2 = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${navigator.guestroomfull.title}", "${navigator.guestroomfull.text}");
                    _local_2.show();
                    break;
                case 3:
                    _local_2 = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${room.queue.error.title}", (("${room.queue.error." + _local_3.parameter) + "}"));
                    _local_2.show();
                    break;
                case 4:
                    _local_2 = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${navigator.banned.title}", "${navigator.banned.text}");
                    _local_2.show();
                    break;
                default:
                    _local_2 = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${room.queue.error.title}", "${room.queue.error.title}");
                    _local_2.show();
            };
            LegacyNavigator(_navigator.legacyNavigator).send(new _SafeStr_316());
            var _local_4:HabboToolbarEvent = new HabboToolbarEvent("HTE_TOOLBAR_CLICK");
            _local_4.iconId = "HTIE_ICON_RECEPTION";
            LegacyNavigator(_navigator.legacyNavigator).toolbar.events.dispatchEvent(_local_4);
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1013 = "_-Z0" (String#19256, DoABC#4)
// _SafeStr_1050 = "_-Cq" (String#30007, DoABC#4)
// _SafeStr_1059 = "_-m1H" (String#28857, DoABC#4)
// _SafeStr_1085 = "_-Jf" (String#30543, DoABC#4)
// _SafeStr_1110 = "_-Fl" (String#30394, DoABC#4)
// _SafeStr_1128 = "_-Kc" (String#30572, DoABC#4)
// _SafeStr_1172 = "_-Y1I" (String#30186, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1208 = "_-w1j" (String#30567, DoABC#4)
// _SafeStr_1211 = "_-q14" (String#29390, DoABC#4)
// _SafeStr_1264 = "_-U1Y" (String#30954, DoABC#4)
// _SafeStr_128 = "_-G1b" (String#12320, DoABC#4)
// _SafeStr_1284 = "_-12L" (String#30967, DoABC#4)
// _SafeStr_1290 = "_-l1B" (String#29435, DoABC#4)
// _SafeStr_1293 = "_-315" (String#30224, DoABC#4)
// _SafeStr_1303 = "_-bd" (String#29931, DoABC#4)
// _SafeStr_1313 = "_-O1K" (String#30875, DoABC#4)
// _SafeStr_1329 = "_-w17" (String#30362, DoABC#4)
// _SafeStr_1338 = "_-x2" (String#28647, DoABC#4)
// _SafeStr_1339 = "_-ey" (String#30462, DoABC#4)
// _SafeStr_1354 = "_-d1" (String#30123, DoABC#4)
// _SafeStr_1375 = "_-sS" (String#28980, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1417 = "_-D1n" (String#30586, DoABC#4)
// _SafeStr_1418 = "_-n19" (String#24362, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_1424 = "_-RL" (String#31135, DoABC#4)
// _SafeStr_1438 = "_-1v" (String#22414, DoABC#4)
// _SafeStr_1486 = "_-3O" (String#24369, DoABC#4)
// _SafeStr_150 = "_-e1i" (String#23031, DoABC#4)
// _SafeStr_1512 = "_-71o" (String#27838, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1621 = "_-MK" (String#13817, DoABC#4)
// _SafeStr_1634 = "_-I1T" (String#11183, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_285 = "_-tX" (String#12581, DoABC#4)
// _SafeStr_288 = "_-k1Z" (String#12190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_311 = "_-026" (String#12669, DoABC#4)
// _SafeStr_316 = "_-hs" (String#6384, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3197 = "_-fs" (String#4924, DoABC#4)
// _SafeStr_3205 = "_-ND" (String#13641, DoABC#4)
// _SafeStr_338 = "_-J19" (String#25216, DoABC#4)
// _SafeStr_346 = "_-Z6" (String#6604, DoABC#4)
// _SafeStr_353 = "_-AY" (String#23266, DoABC#4)
// _SafeStr_373 = "_-U1c" (String#6702, DoABC#4)
// _SafeStr_404 = "_-M1U" (String#6652, DoABC#4)
// _SafeStr_432 = "_-uV" (String#12292, DoABC#4)
// _SafeStr_444 = "_-l5" (String#13440, DoABC#4)
// _SafeStr_463 = "_-G1u" (String#12314, DoABC#4)
// _SafeStr_499 = "_-s1j" (String#11707, DoABC#4)
// _SafeStr_507 = "_-q1U" (String#12607, DoABC#4)
// _SafeStr_513 = "_-M1S" (String#8781, DoABC#4)
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_551 = "_-vR" (String#11714, DoABC#4)
// _SafeStr_571 = "_-X11" (String#11722, DoABC#4)
// _SafeStr_591 = "_-S1g" (String#12383, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_673 = "_-02X" (String#24077, DoABC#4)
// _SafeStr_678 = "_-32B" (String#11905, DoABC#4)
// _SafeStr_682 = "_-k1M" (String#12474, DoABC#4)
// _SafeStr_703 = "_-q16" (String#13017, DoABC#4)
// _SafeStr_707 = "_-S14" (String#22054, DoABC#4)
// _SafeStr_716 = "_-ac" (String#24074, DoABC#4)
// _SafeStr_717 = "_-S1l" (String#12160, DoABC#4)
// _SafeStr_724 = "_-ds" (String#12992, DoABC#4)
// _SafeStr_748 = "_-m1e" (String#8180, DoABC#4)
// _SafeStr_781 = "_-81h" (String#19788, DoABC#4)
// _SafeStr_785 = "_-K10" (String#4948, DoABC#4)
// _SafeStr_787 = "_-9t" (String#5939, DoABC#4)
// _SafeStr_789 = "_-No" (String#13138, DoABC#4)
// _SafeStr_823 = "_-sE" (String#12148, DoABC#4)
// _SafeStr_865 = "_-Z1f" (String#12165, DoABC#4)
// _SafeStr_876 = "_-Dm" (String#12920, DoABC#4)
// _SafeStr_894 = "_-31b" (String#23293, DoABC#4)
// _SafeStr_903 = "_-80" (String#9168, DoABC#4)
// _SafeStr_924 = "_-01X" (String#12393, DoABC#4)
// _SafeStr_934 = "_-cF" (String#19049, DoABC#4)
// _SafeStr_972 = "_-aI" (String#6424, DoABC#4)
// _SafeStr_977 = "_-Wo" (String#11628, DoABC#4)
// _SafeStr_997 = "_-h17" (String#11663, DoABC#4)


