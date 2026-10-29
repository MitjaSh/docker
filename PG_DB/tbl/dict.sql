drop table invest_stat.dict;

create table invest_stat.dict (
 dict   varchar(50)
,id     integer
,value  varchar(255)
);

ALTER TABLE invest_stat.dict ADD PRIMARY KEY (dict ,id);

insert into invest_stat.dict (dict, id, value) values ('operation_state', 1, 'OPERATION_STATE_EXECUTED');
insert into invest_stat.dict (dict, id, value) values ('operation_state', 2, 'OPERATION_STATE_CANCELED');


insert into invest_stat.dict (dict, id, value) values ('operation_type', 0, 'OPERATION_TYPE_UNSPECIFIED');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 1, 'OPERATION_TYPE_INPUT');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 2, 'OPERATION_TYPE_BOND_TAX');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 3, 'OPERATION_TYPE_OUTPUT_SECURITIES'); -- Вывод ценных бумаг со счета.
insert into invest_stat.dict (dict, id, value) values ('operation_type', 4, 'OPERATION_TYPE_OVERNIGHT'); -- Доход по овернайту (размещение свободных средств на ночь).
insert into invest_stat.dict (dict, id, value) values ('operation_type', 5, 'OPERATION_TYPE_TAX');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 6, 'OPERATION_TYPE_BOND_REPAYMENT_FULL');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 7, 'OPERATION_TYPE_SELL_CARD'); -- Продажа активов напрямую с выводом на карту.
insert into invest_stat.dict (dict, id, value) values ('operation_type', 8, 'OPERATION_TYPE_DIVIDEND_TAX');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 9, 'OPERATION_TYPE_OUTPUT');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 10, 'OPERATION_TYPE_BOND_REPAYMENT');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 11, 'OPERATION_TYPE_TAX_CORRECTION');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 12, 'OPERATION_TYPE_SERVICE_FEE'); -- Комиссия за обслуживание счета/
insert into invest_stat.dict (dict, id, value) values ('operation_type', 13, 'OPERATION_TYPE_BENEFIT_TAX'); -- Налог на материальную выгоду
insert into invest_stat.dict (dict, id, value) values ('operation_type', 14, 'OPERATION_TYPE_MARGIN_FEE'); -- Комиссия за непокрытую позицию (маржа)
insert into invest_stat.dict (dict, id, value) values ('operation_type', 15, 'OPERATION_TYPE_BUY');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 16, 'OPERATION_TYPE_BUY_CARD'); -- Покупка ценной бумаги напрямую с карты
insert into invest_stat.dict (dict, id, value) values ('operation_type', 17, 'OPERATION_TYPE_INPUT_SECURITIES');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 18, 'OPERATION_TYPE_SELL_MARGIN'); -- Продажа в результате Margin-call
insert into invest_stat.dict (dict, id, value) values ('operation_type', 19, 'OPERATION_TYPE_BROKER_FEE');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 20, 'OPERATION_TYPE_BUY_MARGIN'); -- Покупка в результате Margin-call
insert into invest_stat.dict (dict, id, value) values ('operation_type', 21, 'OPERATION_TYPE_DIVIDEND');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 22, 'OPERATION_TYPE_SELL');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 23, 'OPERATION_TYPE_COUPON');
insert into invest_stat.dict (dict, id, value) values ('operation_type', 24, 'OPERATION_TYPE_SUCCESS_FEE'); -- Комиссия за успех (для автоследования)
insert into invest_stat.dict (dict, id, value) values ('operation_type', 25, 'OPERATION_TYPE_DIVIDEND_TRANSFER'); -- Перевод дивидендов на внешний счет
insert into invest_stat.dict (dict, id, value) values ('operation_type', 26, 'OPERATION_TYPE_ASSET_REALLOCATION'); -- Перераспределение активов
insert into invest_stat.dict (dict, id, value) values ('operation_type', 27, 'OPERATION_TYPE_CORPORATE_ACTION'); --Прочие корпоративные действия
insert into invest_stat.dict (dict, id, value) values ('operation_type', 28, 'OPERATION_TYPE_CASH_FEE'); -- Комиссия за наличные
insert into invest_stat.dict (dict, id, value) values ('operation_type', 29, 'OPERATION_TYPE_COUPON_TRANSFER'); -- Перевод купонов на внешний счет
insert into invest_stat.dict (dict, id, value) values ('operation_type', 30, 'OPERATION_TYPE_COMMISSION_OTHER'); -- Прочие комиссии брокера/биржи
insert into invest_stat.dict (dict, id, value) values ('operation_type', 32, 'OPERATION_TYPE_TAX_PROGRESSIVE'); -- Базовое удержание налога по ставке 15%
insert into invest_stat.dict (dict, id, value) values ('operation_type', 33, 'OPERATION_TYPE_BOND_TAX_PROGRESSIVE'); -- Налог по купонам облигаций по ставке 15%
insert into invest_stat.dict (dict, id, value) values ('operation_type', 34, 'OPERATION_TYPE_DIVIDEND_TAX_PROGRESSIVE'); -- Налог по дивидендам акций по ставке 15%
insert into invest_stat.dict (dict, id, value) values ('operation_type', 35, 'OPERATION_TYPE_BENEFIT_TAX_PROGRESSIVE'); -- Налог на матвыгоду по ставке 15%
insert into invest_stat.dict (dict, id, value) values ('operation_type', 36, 'OPERATION_TYPE_TAX_CORRECTION_PROGRESSIVE'); -- Корректировка прогрессивного налога
insert into invest_stat.dict (dict, id, value) values ('operation_type', 44, 'OPERATION_TYPE_TAX_CORRECTION_COUPON'); -- Корректировка налога по купонам облигаций.
insert into invest_stat.dict (dict, id, value) values ('operation_type', 47, 'OPERATION_TYPE_OUT_STAMP_DUTY'); -- Гербовый сбор (Stamp Duty)


insert into invest_stat.dict (dict, id, value) values ('trading_status', 0, 'SECURITY_TRADING_STATUS_UNSPECIFIED'); -- Статус не определен (системная ошибка)
insert into invest_stat.dict (dict, id, value) values ('trading_status', 1, 'SECURITY_TRADING_STATUS_NOT_AVAILABLE_FOR_TRADING'); -- Торги недоступны. Бумага полностью заблокирована, снята с торгов (делистинг) или сессия еще не началась.
insert into invest_stat.dict (dict, id, value) values ('trading_status', 2, 'SECURITY_TRADING_STATUS_OPENING_PERIOD'); -- Период открытия (аукцион открытия на бирже)
insert into invest_stat.dict (dict, id, value) values ('trading_status', 3, 'SECURITY_TRADING_STATUS_CLOSING_PERIOD'); -- Период закрытия (аукцион закрытия на бирже)
insert into invest_stat.dict (dict, id, value) values ('trading_status', 4, 'SECURITY_TRADING_STATUS_BREAK_IN_TRADING'); -- Перерыв в торгах (техническая пауза на стороне биржи)
insert into invest_stat.dict (dict, id, value) values ('trading_status', 5, 'SECURITY_TRADING_STATUS_NORMAL_TRADING'); -- Нормальная торговля. Бумага полностью доступна, ликвидность есть, заявки принимаются.
insert into invest_stat.dict (dict, id, value) values ('trading_status', 6, 'SECURITY_TRADING_STATUS_CLOSING_AUCTION'); -- Аукцион закрытия.
insert into invest_stat.dict (dict, id, value) values ('trading_status', 7, 'SECURITY_TRADING_STATUS_DARK_POOL_AUCTION'); -- Внебиржевой аукцион (даркпул)
insert into invest_stat.dict (dict, id, value) values ('trading_status', 8, 'SECURITY_TRADING_STATUS_DISCRETE_AUCTION'); -- Дискретный аукцион (включается биржей при резком падении/росте цены)
insert into invest_stat.dict (dict, id, value) values ('trading_status', 9, 'SECURITY_TRADING_STATUS_OPENING_AUCTION_PERIOD'); -- Период аукциона открытия.
insert into invest_stat.dict (dict, id, value) values ('trading_status', 10, 'SECURITY_TRADING_STATUS_TRADING_AT_CLOSING_AUCTION_PRICE'); -- Торги по цене аукциона закрытия.
insert into invest_stat.dict (dict, id, value) values ('trading_status', 11, 'SECURITY_TRADING_STATUS_SESSION_ASSIGNED'); -- Сессия назначена (технический статус подготовки торгов).
insert into invest_stat.dict (dict, id, value) values ('trading_status', 12, 'SECURITY_TRADING_STATUS_SESSION_ACTIVE'); -- Сессия активна (но основные торги еще могут быть недоступны).
insert into invest_stat.dict (dict, id, value) values ('trading_status', 13, 'SECURITY_TRADING_STATUS_SESSION_TERMINATED'); -- Сессия завершена.
insert into invest_stat.dict (dict, id, value) values ('trading_status', 14, 'SECURITY_TRADING_STATUS_DEALER_NOT_AVAILABLE_FOR_TRADING'); -- Торги недоступны у маркетмейкера (дилера).
insert into invest_stat.dict (dict, id, value) values ('trading_status', 15, 'SECURITY_TRADING_STATUS_DEALER_NORMAL_TRADING'); -- Нормальная торговля у маркетмейкера (обычно для внебиржевых инструментов).


insert into invest_stat.dict (dict, id, value) values ('bond_type', 0, 'NORMAL_BOND');
insert into invest_stat.dict (dict, id, value) values ('bond_type', 1, 'REPLACEMENT_BOND');
commit;