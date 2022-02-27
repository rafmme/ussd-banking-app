import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/models/bank.dart';

List<Bank> banksList = [
  Bank(
      name: 'Access Bank',
      image: 'assets/images/accessbank.png',
      color: kAccessBankColor,
      ussdCode: '*901#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*901#',
        },
        {
          'action': 'Deactive USSD Banking',
          'code': '*901*911#',
        },
        {
          'action': 'Update Info',
          'code': '*901*12#',
        },
        {
          'action': 'Check Balance',
          'code': '*901*5#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*901*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*901*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers(to Access Bank)',
          'code': '*901*1*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Money Transfers(to other banks)',
          'code': '*901*2*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Data Purchase',
          'code': '*901*8#',
        },
        {
          'action': 'Open Account',
          'code': '*901*0#',
        },
        {
          'action': 'OTP Generation',
          'code': '*901*4*1#',
        },
        {
          'action': 'Instant Pay Day Loan',
          'code': '*901*11#',
        },
        {
          'action': 'Salary Advance & Small Ticket Loan',
          'code': '*901*11*1#',
        },
        {
          'action': 'Dual Transaction Service (DTS)',
          'code': '*901*14#',
        },
        {
          'action': 'Pay Merchants',
          'code': '*901*1*merchantCode*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
        {
          'action': 'LCC Toll Top-Up',
          'code': '*901*000*522*accountNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'LCC Account Number',
        },
        {
          'action': 'Bill Payment',
          'code': '*901*3#',
        }
      ],
      bankInfo:
          'Access Bank PLC\nNSE: ACCESS\n\nHeadquarters: 14/15, Prince Alaba Abiodun Oniru Road, Victoria Island, Lagos, Lagos State, Nigeria.\n\nhttps://www.accessbankplc.com/'),
  Bank(
      name: 'Eco Bank',
      image: 'assets/images/ecobank.png',
      color: kEcoBankColor,
      ussdCode: '*326#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*326#',
        },
      ],
      bankInfo: 'Ecobank Nigeria\n\nNSE: EBN\n\nhttps://ecobank.com/ng'),
  Bank(
      name: 'FCMB',
      image: 'assets/images/fcmbbank.jpg',
      color: kFCMBColor,
      ussdCode: '*389*214#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*389*214#',
        },
      ],
      bankInfo: 'First City Monumental Bank of Nigeria.'),
  Bank(
      name: 'Fidelity Bank',
      image: 'assets/images/fidelitybank.jpg',
      color: kFidelityBankColor,
      ussdCode: '*770#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*770#',
        },
        {
          'action': 'Check Balance',
          'code': '*770*0#',
        },
        {
          'action': 'Block your Card',
          'code': '*770*911#',
        },
        {
          'action': 'Block Account',
          'code': '*770*08012345678#',
        },
        {
          'action': 'Disable Instant Banking',
          'code': '*770*911*phoneNumber#',
          'dialUp': 'no',
          'showText': 'Phone Number',
        },
        {
          'action': 'Deactivate mobile banking',
          'code': '*770*20*0#',
        },
        {
          'action': 'Update BVN',
          'code': '*770*02#',
        },
        {
          'action': 'Reset your mobile banking PIN',
          'code': '*770*00#',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*770*8*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers',
          'code': '*770*accountNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*770*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*770*phoneNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Select between SMS and email alerts',
          'code': '*770*2#',
        },
        {
          'action': 'Pay Electricity Bill',
          'code': '*770*code*meterNumber*amount#',
          'dialUp': 'no',
          'disco': {
            'Choose your Area Electricity Disco.': '0',
            'Enugu (EEDC) Postpaid': '1022',
            'Enugu (EEDC) Prepaid': '1021',
            'Ibadan (IBEDC)': '1044',
            'Kano (KEDCO) Prepaid': '1013',
            'Kano (KEDCO) Postpaid': '1014',
            'Port Harcourt (PHED)': '1017',
            'Benin (BEDC) Postpaid': '1015',
            'EKEDP Prepaid': '1011',
            'EKEDP Postpaid': '1012',
          },
          'amo': 'false',
          'electricity': 'wema'
        },
        {
          'action': 'DSTV',
          'code': '*770*1099*smartCardNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Smart Card Number',
        },
        {
          'action': 'DSTV Box Office',
          'code': '*770*1098*smartCardNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Smart Card Number',
        },
        {
          'action': 'Startimes',
          'code': '*770*1077*smartCardNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Smart Card Number',
        },
        {
          'action': 'GOTV',
          'code': '*770*1088*decoderNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Decoder Number',
        },
        {
          'action': 'Swift 4G Sub.',
          'code': '*770*1033*customerID*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Customer ID',
        },
        {
          'action': 'NairaBet',
          'code': '*770*1055*customerID*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Customer Reference',
        },
        {
          'action': 'LCC Toll Payments',
          'code': '*770*1066*customerID*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'LCC Account Number',
        },
        {
          'action': 'Lagos Toll Company (LTC)',
          'code': '*770*1068*customerID*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
      ],
      bankInfo: 'Fidelity Bank of Nigeria.'),
  Bank(
      name: 'First Bank',
      image: 'assets/images/firstbank.png',
      color: kFirstBankColor,
      ussdCode: '*894#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*894#',
        },
        {
          'action': 'Deactivate Mobile Number',
          'code': '*894*911#',
        },
        {
          'action': 'Check Balance',
          'code': '*894*00#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*894*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*894*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers',
          'code': '*894*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Mini Statement',
          'code': '*894*accountNumber#',
          'dialUp': 'no',
          'showText': 'Account Number',
        },
        {
          'action': 'Open Account',
          'code': '*894*0#',
        },
      ],
      bankInfo:
          'First Bank of Nigeria\n\nHeadquarters: 35 Marina, Lagos, Lagos State, Nigeria\n\nhttps://firstbanknigeria.com/'),
  Bank(
      name: 'GTB',
      image: 'assets/images/gtbank.png',
      color: kGTBColor,
      ussdCode: '*737#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*737#',
        },
        {
          'action': 'Open Account',
          'code': '*737*0#',
        },
        {
          'action': 'Reactivate Account',
          'code': '*737*11#',
        },
        {
          'action': 'Account Info (BVN, Bal.)',
          'code': '*737*6*1#',
        },
        {
          'action': 'Mini Statement',
          'code': '*737*51*30#',
        },
        {
          'action': '3rd Party Statement',
          'code': '*737*51*33#',
        },
        {
          'action': 'Loan Balances',
          'code': '*737*6*2#',
        },
        {
          'action': 'Card Status',
          'code': '*737*6*3#',
        },
        {
          'action': 'Cheque Book Status',
          'code': '*737*6*4#',
        },
        {
          'action': 'Card Hotlist',
          'code': '*737*51*10#',
        },
        {
          'action': 'Account Blackist',
          'code': '*737*51*74#',
        },
        {
          'action': 'Show/Hide Account Balance on GeNS',
          'code': '*737*51*1#',
        },
        {
          'action': 'Spend To Save',
          'code': '*737*51*24#',
        },
        {
          'action': 'QuickCredit Request',
          'code': '*737*51*51#',
        },
        {
          'action': 'QuickCredit Liquidation',
          'code': '*737*51*55#',
        },
        {
          'action': 'Reference Confirmation',
          'code': '*737*51*54#',
        },
        {
          'action': 'Data Top-up',
          'code': '*737*4#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*737*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*737*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers (GTBank Account)',
          'code': '*737*1*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Money Transfers (Other Banks)',
          'code': '*737*2*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Airtime Advance',
          'code': '*737*8*1#',
        },
        {
          'action': 'School Fees Advance',
          'code': '*737*52*30#',
        },
        {
          'action': 'Salary Advance',
          'code': '*737*8*2#',
        },
        {
          'action': 'PayDay Loan',
          'code': '*737*52*40#',
        },
        {
          'action': 'Create Transaction PIN',
          'code': '*737*5#',
        },
        {
          'action': 'SKS Standing Instruction',
          'code': '*737*52*amount*26#',
          'dialUp': 'no',
        },
        {
          'action': '737 Cashout Service',
          'code': '*737*50*amount*50#',
          'dialUp': 'no',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*737*3*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Generate OTP',
          'code': '*737*7#',
        },
        {
          'action': 'Fast Track Withdrawal',
          'code': '*737*49#',
        },
        {
          'action': 'Fast Track Deposit',
          'code': '*737*48*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Cable TV',
          'code': '*737*smartCardNumber#',
          'showText': 'Smart Card Number',
          'dialUp': 'no',
        },
        {
          'action': 'StarTimes Subscription',
          'code': '*737*37*amount*decoderNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Decoder Number',
        },
        {
          'action': 'Pay Merchants',
          'code': '*737*35*amount*merchantCode#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
        {
          'action': 'Pay Bills',
          'code': '*737*50#',
        },
        {
          'action': 'Swift Network Subscription',
          'code': '*737*50*amount*4#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay Electricity Bill',
          'code': '*737*50*amount*code#',
          'dialUp': 'no',
          'disco': {
            'Choose your Area Electricity Disco.': '0',
            'Port Harcourt Prepaid': '95',
            'Port Harcourt Postpaid': '96',
            'Eko Prepaid': '151',
            'Eko Postpaid': '152',
            'Ibadan Prepaid': '137',
            'Kano Prepaid': '93',
            'Kano Postpaid': '94',
          },
          'amo': 'false',
          'electricity': 'gtb'
        },
        {
          'action': 'LCC Toll Payments',
          'code': '*737*50*amount*108#',
          'dialUp': 'no',
        },
        {
          'action': '737 Edu',
          'code': '*737*31*amount*merchantCode#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
        {
          'action': '737 Give',
          'code': '*737*32*amount*merchantCode#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
      ],
      bankInfo:
          'Guaranty Trust Holding Company PLC (GTCO PLC)\nLSE: GRTB\n\nHeadquarters: 635 Akin Adesola Street, Victoria Island, Lagos, Lagos State, Nigeria\n\nhttps://www.gtbank.com/'),
  Bank(
      name: 'Heritage Bank',
      image: 'assets/images/heritagebank.png',
      color: kHeritageBankColor,
      ussdCode: '*322*030#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*322*030#',
        },
      ],
      bankInfo:
          'Heritage Bank Plc\n\nHeadquarters: 292B Ajose Adeogun Street, Victoria Island, Lagos, Lagos State, Nigeria.\n\nhttps://www.hbng.com'),
  Bank(
      name: 'Jaiz Bank',
      image: 'assets/images/jaizbank.png',
      color: kJaizBankColor,
      ussdCode: '*773#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*773#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*773*amount#',
          'dialUp': 'no',
        },
      ],
      bankInfo: 'Jaiz Bank of Nigeria.'),
  Bank(
      name: 'Keystone',
      image: 'assets/images/keystonebank.png',
      color: kKeystoneBankColor,
      ussdCode: '*322*082#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*322*082#',
        },
      ],
      bankInfo:
          'Keystone Bank Limited\n\nHeadquarters: Victoria Island, Lagos, Lagos State, Nigeria.\n\nhttps://www.keystonebankng.com'),
  Bank(
      name: 'Lotus Bank',
      image: 'assets/images/lotusbank.png',
      color: kLotusBankColor,
      ussdCode: '*5045#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*5045#',
        },
        {
          'action': 'Check Balance',
          'code': '*5045*5*1#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*5045*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*5045*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers (Lotus to Lotus)',
          'code': '*5045*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Money Transfers (to other banks)',
          'code': '*5045*3*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Data',
          'code': '*5045*2*#',
        },
      ],
      bankInfo: 'Lotus Bank of Nigeria.'),
  Bank(
      name: 'Polaris Bank',
      image: 'assets/images/polarisbank.png',
      color: kPolarisBankColor,
      ussdCode: '*833#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*833#',
        },
        {
          'action': 'Open Account',
          'code': '*833*1#',
        },
        {
          'action': 'Hotlist Card',
          'code': '*833*4#',
        },
        {
          'action': 'Check Balance',
          'code': '*833*6#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*833*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*833*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers',
          'code': '*833*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Pay Bills',
          'code': '*833*2#',
        },
        {
          'action': 'Pay with MasterPass',
          'code': '*833*7#',
        },
        {
          'action': 'Update BVN',
          'code': '*833*5#',
        },
      ],
      bankInfo:
          'Polaris Bank Limited\n\nHeadquarters: 3 Akin Adesola Street Victoria Island, Lagos, Lagos State, Nigeria.\n\nhttps://polarisbanklimited.com'),
  Bank(
      name: 'Stanbic IBTC',
      image: 'assets/images/stanbicibtcbank.png',
      color: kStanbicIBTCColor,
      ussdCode: '*909#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*909#',
        },
      ],
      bankInfo:
          'Stanbic IBTC Holdings PLC\nNSE: STANBIC\n\nHeadquarters: I.B.T.C. Place, Walter Carrington Crescent, Victoria Island, Lagos State, Nigeria\n\nhttps://www.stanbicibtc.com'),
  Bank(
      name: 'Standard Chartered',
      image: 'assets/images/standardbank.png',
      color: kStandardCharteredBankColor,
      ussdCode: '*977#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*977#',
        },
        {
          'action': 'Check Balance',
          'code': '*977*00#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*977*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*977*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers',
          'code': '*977*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Data Subscription (self)',
          'code': '*977*2#',
        },
        {
          'action': 'Data Subscription (others)',
          'code': '*977*2*phoneNumber#',
          'dialUp': 'no',
          'showText': 'Phone Number',
        },
      ],
      bankInfo: 'Standard Chartered Bank of Nigeria.'),
  Bank(
      name: 'Sterling Bank',
      image: 'assets/images/sterlingbank.png',
      color: kSterlingBankColor,
      ussdCode: '*822#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*822#',
        },
        {
          'action': 'Open Account',
          'code': '*822*7#',
        },
        {
          'action': 'Manage Cards',
          'code': '*822*19#',
        },
        {
          'action': 'Check Balance',
          'code': '*822*6#',
        },
        {
          'action': 'Check Account Number',
          'code': '*822*8#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*822*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*822*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers',
          'code': '*822*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*822*42#',
        },
        {
          'action': 'Pay Bills',
          'code': '*822*2#',
        },
        {
          'action': 'Pay Sterling Merchants',
          'code': '*822*28*amount*merchantCode#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
        {
          'action': 'Pay Coral Pay Merchants',
          'code': '*822*000*refNumber#',
          'dialUp': 'no',
          'showText': 'Ref. Number',
        },
        {
          'action': 'Pay MCash Merchants',
          'code': '*822*22*merchantCode*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
        {
          'action': 'LCC Toll Payments',
          'code': '*822*15#',
        },
      ],
      bankInfo:
          'Sterling Bank Plc\nNSE: STERLNBANK\n\nHeadquarters: Sterling Towers, 20 Marina, P.M.B. 12735, Lagos, Lagos State, Nigeria\n\nhttps://www.sterling.ng'),
  Bank(
      name: 'Taj Bank',
      image: 'assets/images/tajbank.png',
      color: kTajBankColor,
      ussdCode: '*898#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*898#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*989*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*989*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers',
          'code': '*898*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
      ],
      bankInfo: 'Taj Bank of Nigeria.'),
  Bank(
      name: 'UBA',
      image: 'assets/images/ubabank.png',
      color: kUBAColor,
      ussdCode: '*919#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*919#',
        },
        {
          'action': 'Register',
          'code': '*919*0#',
        },
        {
          'action': 'Get Bank Statement',
          'code': '*919*21#',
        },
        {
          'action': 'Check Balance',
          'code': '*919*00#',
        },
        {
          'action': 'Freeze Online Transactions',
          'code': '*919*9#',
        },
        {
          'action': 'Block Debit Card',
          'code': '*919*10#',
        },
        {
          'action': 'Generate OTP',
          'code': '*919*8#',
        },
        {
          'action': 'Retrieve BVN',
          'code': '*919*18#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*919*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*919*phoneNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Buy Data (for self)',
          'code': '*919*14#',
        },
        {
          'action': 'Buy Data (for others)',
          'code': '*919*14*phoneNumber#',
          'dialUp': 'no',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers (to UBA Account)',
          'code': '*919*3*accountNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Money Transfers (to other Banks)',
          'code': '*919*4*accountNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Transfer using Mobile Number',
          'code': '*919*36#',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*919*30*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Load UBA Prepaid Card',
          'code': '*919*32#',
        },
        {
          'action': 'Click Credit',
          'code': '*919*28#',
        },
        {
          'action': 'Make Konga Payment',
          'code': '*919*15*refNumber#',
          'dialUp': 'no',
          'showText': 'Ref. ID',
        },
        {
          'action': 'Smile Top-Up',
          'code': '*919*23#',
        },
        {
          'action': 'Other Bills Payment',
          'code': '*919*5#',
        },
        {
          'action': "St. Mary's Hospital Payment",
          'code': '*919*25*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Fund Bet9ja Wallet',
          'code': '*919*22*walletID*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Bet9ja Wallet ID',
        },
        {
          'action': 'Fund BetKing Wallet',
          'code': '*919*26*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Fund Baba Ijebu Wallet',
          'code': '*919*26*1#',
        },
        {
          'action': 'Fund Lottomania Wallet',
          'code': '*919*26*2#',
        },
        {
          'action': 'ARM Pensions',
          'code': '*919*27*1#',
        },
        {
          'action': 'Oak Pensions',
          'code': '*919*27*2#',
        },
        {
          'action': 'Check LCC e-tag balance',
          'code': '*919*16*1#',
        },
        {
          'action': 'Top-Up LCC e-tag',
          'code': '*919*16*2#',
        },
        {
          'action': 'DSTV & GOTV Payment',
          'code': '*919*5*2#',
        },
        {
          'action': 'Tax & Levies',
          'code': '*919*13#',
        },
        {
          'action': 'Purchase Event Tickets',
          'code': '*919*7#',
        },
        {
          'action': 'Airline Tickets Menu',
          'code': '*919*12#',
        },
        {
          'action': 'Ethopia Airline',
          'code': '*919*12*071#',
        },
        {
          'action': 'Africa World Airline',
          'code': '*919*12*394#',
        },
        {
          'action': 'Lufthansa Airline',
          'code': '*919*12*220#',
        },
        {
          'action': 'Egypt Airline',
          'code': '*919*12*077#',
        },
        {
          'action': 'Turkish Airline',
          'code': '*919*12*235#',
        },
        {
          'action': 'Qatar Airways',
          'code': '*919*12*157#',
        },
        {
          'action': 'British Airways',
          'code': '*919*12*125#',
        },
        {
          'action': 'KLM Royal Dutch Airline',
          'code': '*919*12*74#',
        },
        {
          'action': 'South African Airways',
          'code': '*919*12*83#',
        },
        {
          'action': 'Etihad Airways',
          'code': '*919*12*607#',
        },
        {
          'action': 'Virgin Atlantic Airline',
          'code': '*919*12*932#',
        },
        {
          'action': 'Royal Air Morocco',
          'code': '*919*12*147#',
        },
        {
          'action': 'Rwanda Air',
          'code': '*919*12*459#',
        },
        {
          'action': 'Kenya Airways',
          'code': '*919*12*706#',
        },
        {
          'action': 'Delta AirLines',
          'code': '*919*12*6#',
        },
        {
          'action': 'Air France',
          'code': '*919*12*57#',
        },
        {
          'action': 'Emirates',
          'code': '*919*12*176#',
        },
      ],
      bankInfo:
          'United Bank for Africa\nNSE: UBA\n\nHeadquarters: UBA House, 57 Marina, Lagos, Lagos State, Nigeria.\n\nhttps://www.ubagroup.com/'),
  Bank(
      name: 'Union Bank',
      image: 'assets/images/unionbank.png',
      color: kUnionBankColor,
      ussdCode: '*826#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*826#',
        },
      ],
      bankInfo: 'Union Bank of Nigeria.'),
  Bank(
      name: 'Unity Bank',
      image: 'assets/images/unitybank.jpg',
      color: kUnityBankColor,
      ussdCode: '*7799#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*7799#',
        },
      ],
      bankInfo:
          'Unity Bank plc\nNSE: UNITYBNK\n\nhttps://www.unitybankng.com/'),
  Bank(
      name: 'Wema Bank',
      image: 'assets/images/wemabank.png',
      color: kWemaBankColor,
      ussdCode: '*945#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*945#',
        },
        {
          'action': 'Account Restriction',
          'code': '*945*911#',
        },
        {
          'action': 'Check Balance',
          'code': '*945*0#',
        },
        {
          'action': 'Change PIN',
          'code': '*945*00#',
        },
        {
          'action': 'Open Account',
          'code': '*945*1#',
        },
        {
          'action': 'Register on 945',
          'code': '*945*01#',
        },
        {
          'action': 'BVN Management',
          'code': '*945*4#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*945*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*945*phoneNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Buy Data',
          'code': '*945*9#',
        },
        {
          'action': 'Money Transfers',
          'code': '*945*accountNumber*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Quick Loan Code',
          'code': '*945*65#',
        },
        {
          'action': 'Cable TV Menu',
          'code': '*945*10#',
        },
        {
          'action': 'DSTV',
          'code': '*945*11*smartCardNumber#',
          'dialUp': 'no',
          'showText': 'Smart Card Number',
        },
        {
          'action': 'GOTV',
          'code': '*945*12*smartCardNumber#',
          'dialUp': 'no',
          'showText': 'Smart Card Number',
        },
        {
          'action': 'Startimes',
          'code': '*945*13*smartCardNumber#',
          'dialUp': 'no',
          'showText': 'Smart Card Number',
        },
        {
          'action': 'Internet Service Menu',
          'code': '*945*15#',
        },
        {
          'action': 'Smile',
          'code': '*945*16#',
        },
        {
          'action': 'Spectranet',
          'code': '*945*18#',
        },
        {
          'action': 'Pay Electricity Bill',
          'code': '*945*code*meterNumber*amount#',
          'dialUp': 'no',
          'disco': {
            'Choose your Area Electricity Disco.': '0',
            'Eko': '25',
            'Ikeja': '26',
            'Ibadan': '27',
            'Abuja': '28',
            'Enugu': '29',
            'Jos': '30',
            'Kaduna': '31',
            'Kano': '32',
            'Port Harcourt': '33',
          },
          'amo': 'false',
          'electricity': 'wema'
        },
        {
          'action': 'Electricity Bill Menu',
          'code': '*945*24#',
        },
        {
          'action': 'WAEC (Check Result)',
          'code': '*945*70#',
        },
        {
          'action': 'JAMB (Check Result)',
          'code': '*945*71#',
        },
        {
          'action': 'Lagos State Collection',
          'code': '*945*40#',
        },
        {
          'action': 'MCash Payment',
          'code': '*945*57*merchantCode*amount#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Merchant Code',
        },
        {
          'action': 'CoralPay Payment',
          'code': '*945*000*refNumber#',
          'dialUp': 'no',
          'showText': 'Ref. Number',
        },
      ],
      bankInfo: 'Wema Bank of Nigeria.'),
  Bank(
      name: 'Zenith Bank',
      image: 'assets/images/zenithbank.png',
      color: kZenithBankColor,
      ussdCode: '*966#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*966#',
        },
        {
          'action': 'Check Balance',
          'code': '*966*00#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*966*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*966*amount*phoneNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Phone Number',
        },
        {
          'action': 'Money Transfers',
          'code': '*966*amount*accountNumber#',
          'dialUp': 'no',
          'amo': 'false',
          'showText': 'Account Number',
        },
        {
          'action': 'Update BVN',
          'code': '*966*bvn#',
          'dialUp': 'no',
          'showText': 'BVN',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*966*60#',
        },
        {
          'action': 'Account Control Code',
          'code': '*966*911#',
        },
        {
          'action': 'Deactivate EazyBanking Profile',
          'code': '*966*20*0#',
        },
      ],
      bankInfo:
          'Zenith Bank Plc\nNSE: ZENITHBANK\n\nHeadquarters: Zenith Heights, Plot 83, Ajose Adeogun street, Victoria Island, Lagos, Lagos State, Nigeria\n\nhttps://www.zenithbank.com'),
];
